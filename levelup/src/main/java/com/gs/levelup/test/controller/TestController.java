package com.gs.levelup.test.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.gs.levelup.email_check.model.service.EmailCheckService;
import com.gs.levelup.email_check.model.vo.EmailCheck;
import com.gs.levelup.schedule.controller.ScheduleController;
import com.gs.levelup.user.model.service.UserService;

@Controller
public class TestController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private EmailCheckService emailCheckService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "sendMail.do", method = RequestMethod.POST)
    public String sendMailTest(
    		HttpServletRequest request,
    		@RequestParam(value="email", required=false) String toEmail) throws Exception{		
		
		if(userService.selectUserEmail(toEmail) != null && userService.selectUserEmail(toEmail).length() > 5) {
			Random random = new Random();
	        int ranNum = random.nextInt(900000) + 100000;
	        
			logger.info("sendMail.do : " + ranNum);
			
			// 메일 내용
			String subject = "The Mana World - 비밀번호 재설정 코드";
			String content = "\n발송된 코드 : " + ranNum;
			
			EmailCheck emailCheck = new EmailCheck(toEmail, ranNum);
			
			emailCheckService.insertEmailCheck(emailCheck);

			String frm = "kimjihyuk_@naver.com";
		
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
			
				mailHelper.setFrom(frm);	
				mailHelper.setTo(toEmail);	
				mailHelper.setSubject(subject);	
				mailHelper.setText(content);

				mailSender.send(mail);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:searchPwd.do?success=" + toEmail + "&message=sendsuccess";
		}else {
			return "redirect:searchPwd.do?success=" + toEmail + "&message=error2";
		}
		
		
        
    }
	
	@RequestMapping(value = "checkCode.do", method = RequestMethod.POST)
	public String checkCodeMethod(
			Model model,
			@RequestParam(name="code") int code,
			@RequestParam(name="email") String email) {

		EmailCheck emailCheck = new EmailCheck(email, code);
		
		int result = emailCheckService.selectCheckCode(emailCheck);
		
		if(result == code) {
			model.addAttribute("email", email);
			return "user/rePwd";
		}else {
			return "redirect:searchPwd.do?success=" + email + "&message=error";
		}
	}
}
