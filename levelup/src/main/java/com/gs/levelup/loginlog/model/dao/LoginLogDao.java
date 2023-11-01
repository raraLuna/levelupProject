package com.gs.levelup.loginlog.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.loginlog.model.vo.LoginLog;

@Repository("loginLogDao")
public class LoginLogDao {
	@Autowired
	private org.mybatis.spring.SqlSessionTemplate sqlSessionTemplateMaria;

	public ArrayList<LoginLog> selectLoginLog(String userId) {
		List<LoginLog> list = sqlSessionTemplateMaria.selectList("logMapper.selectLoginLog",userId);
		return (ArrayList<LoginLog>)list;
	}

}
