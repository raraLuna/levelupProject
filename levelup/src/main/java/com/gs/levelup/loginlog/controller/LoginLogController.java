package com.gs.levelup.loginlog.controller;

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

import com.gs.levelup.loginlog.model.service.LoginLogService;
import com.gs.levelup.loginlog.model.vo.LoginLog;

@Controller
public class LoginLogController {
	private static final Logger logger = LoggerFactory.getLogger(LoginLogController.class);

	@Autowired
	private LoginLogService loginLogService;

	@RequestMapping(value="loginLog.do",method= { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void selectLoginLog(
			HttpServletResponse response,
			@RequestParam("userId") String userId) throws IOException {
		ArrayList<LoginLog> loginLog= loginLogService.selectLoginLog(userId);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		for(LoginLog b : loginLog) {
			out.append(b.toString() + "\n");
		}

		out.flush();
		out.close();
	}

}
