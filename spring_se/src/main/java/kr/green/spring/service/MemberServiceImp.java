package kr.green.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.spring.dao.MemberDAO;
import kr.green.spring.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	@Autowired 
	MemberDAO memberDao;

	@Override
	public String getEmail(String id) {
		if(id == null)
			return null;
		
		return memberDao.selectEmail(id);
	}

	@Override
	public MemberVO getMember(String id) {
		if(id == null)
			return null;
		
		return memberDao.selectUserInfo(id);
	}

	@Override
	public MemberVO getMember(MemberVO member) {
		if(member == null || member.getMe_id() == null || member.getMe_pw() == null)
		return null;
		
		MemberVO dbMember = memberDao.selectUserInfo(member.getMe_id());
		if(dbMember == null)
			return null;
		if(dbMember.getMe_pw().equals(member.getMe_pw()))
			return dbMember;
		return null;
	}

	@Override
	public MemberVO getMember2(MemberVO member) {
		if(member == null || member.getMe_id() == null || member.getMe_pw() == null)
			return null;
		
		
		return memberDao.selectUserInfo2(member);
	}
}
