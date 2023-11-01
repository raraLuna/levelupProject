package com.gs.levelup.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestTemplate {
	@RequestMapping(value="testTemplate.do", method= { RequestMethod.GET, RequestMethod.POST})
	public String testTemplate() {
		return "test/testJSP";
	}
}
