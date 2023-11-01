package com.gs.levelup.loginlog.model.service;

import java.util.ArrayList;

import com.gs.levelup.loginlog.model.vo.LoginLog;

public interface LoginLogService {
	public ArrayList<LoginLog> selectLoginLog(String userId);
}
