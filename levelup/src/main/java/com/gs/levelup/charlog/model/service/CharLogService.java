package com.gs.levelup.charlog.model.service;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.gs.levelup.charlog.model.vo.CharLog;

public interface CharLogService {
	public ArrayList<CharLog> selectCharLog(int charId);
}
