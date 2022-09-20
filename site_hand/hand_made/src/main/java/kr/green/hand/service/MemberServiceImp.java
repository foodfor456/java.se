package kr.green.hand.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.hand.dao.MemberDAO;
import kr.green.hand.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender;
	
	private String createRandom(String str, int count) {
		if(str == null)
			return "";
		String randomStr = "";
		
		for(int i = 0; i < count; i++) {
			int r = (int)(Math.random()*str.length());
			randomStr += str.charAt(r);
		}
		return randomStr;
	}
	
	@Override
	public boolean signup(MemberVO member, Integer me_validate) {
		if(member == null || member.getMe_id() == null || member.getMe_id().length() <= 4)
			return false;
		String encPw = passwordEncoder.encode(member.getMe_pw());
		if(me_validate != 1) {
			me_validate = 0;
		}
		member.setMe_pw(encPw);
    member.setMe_vali(me_validate);
    member.setMe_authority(me_validate);
		memberDao.signUp(member);
		return true;
	}

	@Override
	public boolean idCheck(MemberVO member) {
		if(member == null || member.getMe_id() == "" || member.getMe_id().length() <= 4)
			return false;
		
		return memberDao.idCheck(member.getMe_id()) == 0 ? true : false;
	}

	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_id() == null || member.getMe_pw() == null)
			return null;
		MemberVO user = memberDao.getMember(member.getMe_id());
		if(user == null || user.getMe_id() == null || user.getMe_pw() == null)
			return null;
		
		if(passwordEncoder.matches(member.getMe_pw(), user.getMe_pw()))
			return user;
		
		return null;
	}

	@Override
	public boolean emailVali(String me_email, String send) {
		if(me_email == null || !send.equals("send"))
			return false;
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String me_code = createRandom(str, 6);
		try {
			// 메일로 링크를 보내줌
			String title = "이메일 인증번호입니다.";
			String content = 
					"이메일 인증을 하여 계정을 활성화 하세요.<br>" +
					"이메일 인증번호는 : "+me_code+" 입니다.";
			sendEmail(title, content, me_email);
			memberDao.insertVali(me_code, me_email);
			
		}catch(Exception e) {
			return false;
		}
		
		return true;
		
		
	}
	@Override
	
	public boolean sendEmail(String title, String content, String receiver) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper 
			    = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom("foodfor987@gmail.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(receiver);     // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true);  // 메일 내용
			
			mailSender.send(message);
   } catch(Exception e){
       System.out.println(e);
   }
		
		 return false;
	}

	@Override
	public boolean emailCheck(String me_vali) {
		if(me_vali == null)
			return false;
		String title = "이메일 인증이 완료되었습니다.";
		String content = "축하합니다.<br> 이메일 인증이 완료되었습니다.";
		String me_email = memberDao.memberCodeCheck(me_vali);
		if(me_email == null) {
			return false;}
		sendEmail(title, content, me_email);
		memberDao.memberValiSuccess(me_email);
		return true;
	}

	
	
}
