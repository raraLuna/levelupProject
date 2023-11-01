package com.gs.levelup;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

// 테스트코드는 was 구동 없이 실행 테스트함
// SpringJUnit4ClassRunner 는 스프링 테스트를 위한 Runner(실행) 클래스임
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration  
//Controller 및 web 환경에 사용되는 bean 들을 자동생성하여 등록
@ContextConfiguration(locations= {"classpath:root-context.xml"})
// 자동으로 연결할 설정파일 지정
public class TestDBConnect {
	private static final Logger logger = LoggerFactory.getLogger(TestDBConnect.class);
	
	// 테스트용 클래스에서 사용될 필드 선언
	@Autowired
	private WebApplicationContext wac;
	// 현재 실행중인 어플리케이션의 구성을 제공하는 인터페이스임
	// 자동 객체생성해서 메모리에 가지고 있다
	
	// JUnit 테스트 진행 전에 먼저 실행한다는 의미의 어노테이션
	@Before
	public void beforeMethod() {
		logger.info("테스트 시작");
	}
	
	@After
	public void afterMethod() {
		logger.info("테스트 종료");
	}
	
	@Test
	public void testDBConnect() {
		// db 연동 확인 테스트용
		try {
			DataSource dataSource = (DataSource)wac.getBean("realDataSource");
			Connection conn = (Connection)dataSource.getConnection();
			logger.info("oracleDB 연결 확인: " + conn);
			
			SqlSessionTemplate session = wac.getBean("sqlSessionTemplate", SqlSessionTemplate.class);
			logger.info("Oracle mybatis 객체 생성 확인: " + session);
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			DataSource dataSource = (DataSource)wac.getBean("mariaDS");
			Connection conn = (Connection)dataSource.getConnection();
			logger.info("mariadb 연결 확인: " + conn);

			SqlSessionTemplate session = wac.getBean("sqlSessionTemplateMaria", SqlSessionTemplate.class);
			logger.info("mariaDB mybatis 객체 생성 확인: " + session);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
