package com.gs.levelup.picklog.model.service;

import java.util.ArrayList;

import com.gs.levelup.picklog.model.vo.PickLog;

public interface PickLogService {
	public ArrayList<PickLog> selectPickLog(int charId);
	public int selectPayItemPickLog(long uniqueId);
	public ArrayList<PickLog> selectPayItemPickLogAll();
}
