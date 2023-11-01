package com.gs.levelup.charlog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gs.levelup.charlog.model.service.CharLogService;
import com.gs.levelup.charlog.model.vo.CharLog;

@Controller
public class CharLogController {
	private static final Logger logger = LoggerFactory.getLogger(CharLogController.class);

	@Autowired
	private CharLogService charLogService;
	
//	@Autowired
//	private LoginLogService loginLogService;
//	
//	@Autowired
//	private PickLogService pickLogService;
//	
//	@Autowired
//	private InventoryService inventoryService;
	
	@RequestMapping("getLogs.do")
	public String getLogs() {
		return "character/getLogs";
	}
	
	@RequestMapping(value="charLog.do",method= { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void selectCharLog(
			HttpServletResponse response,
			@RequestParam("charId") int charId) throws IOException {
		ArrayList<CharLog> charLog= charLogService.selectCharLog(charId);
		logger.info("charLog.do : " + charLog);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		for(CharLog b : charLog) {
			out.append(b.toString() + "\n");
		}

		out.flush();
		out.close();
	}
}
