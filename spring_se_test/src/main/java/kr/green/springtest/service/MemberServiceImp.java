package kr.green.springtest.service;

import java.util.ArrayList;
import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.green.springtest.dao.MemberDAO;
import kr.green.springtest.vo.MemberVO;
 
@Service
public class MemberServiceImp implements MemberService {
    @Autowired
    MemberDAO memberDao;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private JavaMailSender mailSender;
    
    @Override
	public boolean signup(MemberVO member) {
		if(member == null)
			return false;
		if( member.getMe_id() == null || member.getMe_pw() == null ||
				member.getMe_birth() == null || member.getMe_email() == null ||
				member.getMe_gender() == null)
			return false;

		MemberVO dbMember = memberDao.selectMember(member.getMe_id());

		if(dbMember != null)
			return false;
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);
		
		memberDao.insertMember(member);
		return true;
	}

	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_id() == null)
			return null;
		
		MemberVO user = memberDao.selectMember(member.getMe_id());
		
		if(user == null)
			return null;
		user.setAutoLogin(member.isAutoLogin());
		
		if(passwordEncoder.matches(member.getMe_pw(), user.getMe_pw()))
			return user;
		
		return null;
	}

	@Override
	public Object idCheck(MemberVO member) {
		if(member == null || member.getMe_id() == null)
			return false;
		if(memberDao.selectMember(member.getMe_id()) != null)
			return false;
		return true;
	}

	@Override
	public String getMemberId(String me_email, String me_birth_str) {
		if(me_email == null || me_birth_str == null)
		return null;
		
		return memberDao.getMemberId(me_email, me_birth_str);
	}

	@Override
	public boolean findPw(MemberVO member) {
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String newPw = "";
		if(member == null || member.getMe_email() == null || member.getMe_birth_str() == null)
			return false;
		
		String id = memberDao.getMemberId(member.getMe_email(), member.getMe_birth_str());
		if(id == null)
			return false;
		
		MemberVO user = memberDao.selectMember(id);
		
		for(int i = 0; i < 8; i++) {
			int r = (int)(Math.random()*str.length());
			newPw += str.charAt(r);
		}
		String encPw = passwordEncoder.encode(newPw);
		user.setMe_pw(encPw);
		memberDao.updateMember(user);
		
		String title = "새 비밀번호가 발급됐습니다.";
		String content = "새 비밀번호는 <br>" + newPw + "</br>입니다";
		
		return sendEmail(user.getMe_email(), title, content);
	}

	public boolean sendEmail(String to, String title, String content) {
	 try {
	   MimeMessage message = mailSender.createMimeMessage();
	   MimeMessageHelper messageHelper 
	       = new MimeMessageHelper(message, true, "UTF-8");
	
	   messageHelper.setFrom("foodfor456@naver.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
	   messageHelper.setTo(to);     // 받는사람 이메일
	   messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	   messageHelper.setText(content, true);  // 메일 내용 true가 없으면 위의 br태그가 문자로 인식됨
	
	   mailSender.send(message);
   }catch(Exception e){
  	 e.printStackTrace();
  	 return false;
   }
		 return true;
	}

	@Override
	public boolean memberUpdate(MemberVO member, MemberVO user) {
		if(member == null || user == null)
			return false;
		
		user.setMe_birth(member.getMe_birth());
		user.setMe_gender(member.getMe_gender());
		user.setMe_email(member.getMe_email());
		
		if(member.getMe_pw().length() != 0 || member.getMe_pw() != null) {
			String encPw = passwordEncoder.encode(member.getMe_pw());
			user.setMe_pw(encPw);
		}
		if(member.getMe_authority() != 0)
			user.setMe_authority(member.getMe_authority());
		
		memberDao.updateMember(user);
		return true;
	}

	@Override
	public void updateMemberSession(String me_id, String session_id, Date session_limit) {
		if(me_id == null)
			return;
		
		memberDao.updateMemberSession(me_id, session_id, session_limit);
		
	}

	@Override
	public MemberVO getMember(String session_id) {
		if(session_id == null)
			return null;
		
		return memberDao.selectMemberBySession(session_id);
	}

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		if(request == null || response == null)
			return;
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		if(user == null)
			return;
		session.removeAttribute("user");
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie == null)
			return;
		loginCookie.setPath("/");
		loginCookie.setMaxAge(0);
		response.addCookie(loginCookie);
		memberDao.updateMemberSession(user.getMe_id(), null, null);
		
		
	}

	@Override
	public ArrayList<MemberVO> adminMemberSelect(MemberVO user) {
		if(user == null || user.getMe_authority() <= 8)
			return null;
		
		
		
		return memberDao.adminMemberSelect(user.getMe_authority());
	}

	@Override
	public boolean adminUpdateAthority(MemberVO member, MemberVO user) {
		if(member == null || user == null)
			return false;
		if(user.getMe_authority() < 8)
			return false;
		MemberVO memberDB = memberDao.selectMember(member.getMe_id());
		if(memberDB == null || memberDB.getMe_authority() >= user.getMe_authority())
			return false;
		
		memberDB.setMe_authority(member.getMe_authority());
		memberDao.updateMember(memberDB);
		return true;
	}
	
	

	
}
