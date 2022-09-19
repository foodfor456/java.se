package kr.green.hand.service;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Override
	public boolean signup(MemberVO member) {
		if(member == null)
			return false;
		
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);
    memberDao.signUp(member);
		return true;
	}

	@Override
	public boolean idCheck(String me_id) {
		if(me_id == null || me_id.length() <= 4)
			return false;
		
		
		return memberDao.idCheck(me_id) == 0 ? true : false;
	}


	
	
}
