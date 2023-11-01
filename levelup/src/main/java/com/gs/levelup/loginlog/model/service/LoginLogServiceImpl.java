package com.gs.levelup.loginlog.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.loginlog.model.dao.LoginLogDao;
import com.gs.levelup.loginlog.model.vo.LoginLog;

@Service("loginLogService")
public class LoginLogServiceImpl implements LoginLogService{
	@Autowired
	private LoginLogDao loginLogDao;

	@Override
	public ArrayList<LoginLog> selectLoginLog(String userId) {
		return loginLogDao.selectLoginLog(userId);
	}
	
	
}
