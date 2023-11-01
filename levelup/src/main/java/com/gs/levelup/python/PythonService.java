package com.gs.levelup.python;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("pythonService")
public class PythonService {
	@Autowired
	private PythonDao pythonDao;

	public int deleteAll() {
		return pythonDao.deleteAll();
	}

	public ArrayList<Python> selectAll() {
		
		return pythonDao.selectAll();
	}
}
