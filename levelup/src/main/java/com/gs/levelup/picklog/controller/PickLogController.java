package com.gs.levelup.picklog.controller;

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

import com.gs.levelup.picklog.model.service.PickLogService;
import com.gs.levelup.picklog.model.vo.PickLog;

@Controller
public class PickLogController {
	private static final Logger logger = LoggerFactory.getLogger(PickLogController.class);

	@Autowired
	private PickLogService pickLogService;
	
	@RequestMapping(value="pickLog.do",method= { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void selectPickLog(
			HttpServletResponse response,
			@RequestParam("charId") int charId) throws IOException {
		ArrayList<PickLog> pickLog= pickLogService.selectPickLog(charId);
		logger.info("pickLog.do : " + pickLog);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		for(PickLog b : pickLog) {
			out.append(b.toString() + "\n");
		}

		out.flush();
		out.close();
	}


}
