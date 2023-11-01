package com.gs.levelup.email_check.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import com.gs.levelup.email_check.model.service.EmailCheckService;
import com.gs.levelup.employee.controller.EmployeeController;

@Controller
public class EmailCheckController {
	// 이 컨트롤러 안의 메소드들이 구동되는지, 값이 잘 전달되었는지 확인을 위한 로그 객체를 생성
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	// Service 연결 처리 : 자동 DI 퍼리
	@Autowired
	private EmailCheckService emailCheckService;
	// 스프링에서는 부모 인터페이스 타입으로 레퍼런스 선언함 : 실행시 후손의 오버라이딩 된 메소드를 연결함

	

}
