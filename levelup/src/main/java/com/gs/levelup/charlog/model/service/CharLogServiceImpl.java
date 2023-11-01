package com.gs.levelup.charlog.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.charlog.model.dao.CharLogDao;
import com.gs.levelup.charlog.model.vo.CharLog;

@Service("charLogService")
public class CharLogServiceImpl implements CharLogService {
	@Autowired
	private CharLogDao charLogDao;

	@Override
	public ArrayList<CharLog> selectCharLog(int charId) {
		return charLogDao.selectCharLog(charId);
	}
	
	

}
