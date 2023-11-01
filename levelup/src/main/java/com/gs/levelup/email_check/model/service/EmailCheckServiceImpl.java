package com.gs.levelup.email_check.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.email_check.model.dao.EmailCheckDao;
import com.gs.levelup.email_check.model.vo.EmailCheck;

@Service("emailCheckService")
public class EmailCheckServiceImpl implements EmailCheckService{
	@Autowired //자동 DI 처리됨 : 자동 객체 생성됨
	private EmailCheckDao emailCheckDao;

	@Override
	public int insertEmailCheck(EmailCheck emailCheck) {
		return emailCheckDao.insertEmailCheck(emailCheck);
	}

	@Override
	public int selectCheckCode(EmailCheck emailCheck) {
		return emailCheckDao.selectCheckCode(emailCheck);
	}
	
	
	
}
