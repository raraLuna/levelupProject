package com.gs.levelup.picklog.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.picklog.model.dao.PickLogDao;
import com.gs.levelup.picklog.model.vo.PickLog;

@Service("pickLogService")
public class PickLogServiceImpl implements PickLogService{
	
	@Autowired
	private PickLogDao pickLogDao;
	
	@Override
	public ArrayList<PickLog> selectPickLog(int charId) {
		return pickLogDao.selectPickLog(charId);
	}
	
	@Override
	public int selectPayItemPickLog(long uniqueId) {
		return pickLogDao.selectPayItemPickLog(uniqueId);
	}
	
	@Override 
	public ArrayList<PickLog> selectPayItemPickLogAll(){
		return pickLogDao.selectPayItemPickLogAll();
	}

}
