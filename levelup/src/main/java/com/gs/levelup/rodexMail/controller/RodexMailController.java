package com.gs.levelup.rodexMail.controller;

import java.time.Instant;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gs.levelup.payment.model.service.PaymentService;
import com.gs.levelup.payment.model.vo.Payment;
import com.gs.levelup.rodexMail.model.service.RodexMailService;

@Controller
public class RodexMailController {
	private static final Logger logger = LoggerFactory.getLogger(RodexMailController.class);

	@Autowired
	private RodexMailService rodexMailService;
	
	@Autowired
	private PaymentService paymentService;

	@RequestMapping("mailList.do")
	public ModelAndView selectListRodexMail(@RequestParam(name = "page", required = false) String page,
			@RequestParam("accountId") int accountId, @RequestParam("charId") int charId, ModelAndView mv) {
		return mv;
	}

	@RequestMapping("maildelete.do")
	public String deleteRodexMail(@RequestParam("mailId") int noticeno, Model model) {
		return null;
	}

	@RequestMapping(value = "purchase.do", method = RequestMethod.POST)
	public String insertRodexMail(
			HttpServletRequest request, 
			@RequestParam(value="paymentKey", required=false) String paymentKey,
			Model model) {
		paymentService.updatePaymentState(paymentKey);  
		
		Payment payment = paymentService.selectPaymentKey(paymentKey);
		
		logger.info("testlogger : " + payment.getCharName());
		long sendDate = Instant.now().toEpochMilli() / 1000;
//		BigDecimal uniqueId = BigDecimal.valueOf(Instant.now().toEpochMilli() * 100 + (new Random().nextInt(10) + 1) * 10
//				+ (new Random().nextInt(10)));

		logger.info("purchase.do : " + payment.getCharName() + ", " + payment.getCharId() + ", " + payment.getItemId() + ", " + sendDate + ", " + payment.getUniqueId());
		
		logger.info("purchaes.do : getId" + payment.getCharId());
		
		Map<String, Object> purchase = new HashMap<String, Object>();
		purchase.put("receiverName", payment.getCharName());
		purchase.put("receiverId", payment.getCharId());
		purchase.put("nameId", payment.getItemId());
		purchase.put("sendDate", sendDate);
		purchase.put("uniqueId", payment.getUniqueId());
		
		if (rodexMailService.insertRodexMail(purchase) > 0) {
			model.addAttribute("message", "구매성공했습니다.");
			return "user/ushop";
		} else {
			model.addAttribute("message", "구매 실패, 고객센터 문의요망");
			model.addAttribute("map", purchase);
			return "purchase/purchaseError";
		}
	}

	// 메일 상세보기 요청 처리용
	@RequestMapping("maildetail.do")
	public ModelAndView selectDetailRodexMail(@RequestParam("mailId") int mailId, ModelAndView mv) {
		return mv;
	}

}
