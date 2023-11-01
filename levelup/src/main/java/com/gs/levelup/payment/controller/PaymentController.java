package com.gs.levelup.payment.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.payment.model.service.PaymentService;
import com.gs.levelup.payment.model.vo.Payment;
import com.gs.levelup.picklog.model.service.PickLogService;

@Controller
public class PaymentController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PaymentService paymentService;	

	@Autowired
	private PickLogService pickLogService;

	// 뷰 페이지 이동 처리용 ---------------------------------------------------

	// 요청 처리용 ----------------------------------------------------------

	@RequestMapping(value = "plist.do", method = RequestMethod.GET)
	public String selectListMethod(@RequestParam(name = "page", required = false) String page, Model model) {

		int currentPage = 1;
		
		
	if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지 게시글 10개씩 출력되게 한다면
		int limit = 10;

		// 총 페이지 수 계산을 위한 게시글 총갯수 조회
		int listCount = paymentService.selectListCount();

		// 페이지 관련 항목 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "plist.do");
		paging.calculator();

		// 페이지에 출력할 목록 조회해 옴
		ArrayList<Payment> list = paymentService.selectList(paging);
		
		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);		
		}
		return "payment/paymentListView";
	}

	@RequestMapping(value = "psearch.do", method = RequestMethod.GET)
	public String selectSearchMethod(@RequestParam("action") String action,
			@RequestParam(name = "begin", required = false) String begin,
			@RequestParam(name = "end", required = false) String end,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "paymentstatus", required = false) String paymentstatus, Model model, RedirectAttributes re) {

		if (action.equals("paymentId")) {
			re.addAttribute("action", action);
			re.addAttribute("keyword", keyword);
			re.addAttribute("page", page);
			return "redirect:psearchid.do";
		} else if (action.equals("paymentstatus")) {
			re.addAttribute("action", action);
			re.addAttribute("paymentstatus", paymentstatus);
			re.addAttribute("page", page);
			return "redirect:psearchpaymentstatus.do";
		} else if (action.equals("date")) {
			re.addAttribute("action", action);
			re.addAttribute("page", page);
			re.addAttribute("begin", begin);
			re.addAttribute("end", end);
			return "redirect:psearchdate.do";
		} else {
			model.addAttribute("message", "검색 실패!");
			return "common/error";
		}
	}

	@RequestMapping(value = "psearchid.do", method = RequestMethod.GET)
	public ModelAndView selectSearchUserIDMethod(ModelAndView mv, @RequestParam("action") String action,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "page", required = false) String page) {
		// 검색결과에 대한 페이징 처리
		// 출력할 페이지 지정
		int currentPage = 1;
		// 전송온 페이지 값이 있다면 추출함
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지당 출력할 목록 갯수 지정
		int limit = 10;

		// 총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
		int listCount = paymentService.selectSearchPaymentIdCount(keyword.trim());

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "psearchid.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);

		ArrayList<Payment> list = paymentService.selectSearchPaymentId(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);

			mv.setViewName("payment/paymentListView");
		} else {
			mv.setViewName("payment/paymentListView");
		}
		return mv;
	}

	@RequestMapping(value = "psearchpaymentstatus.do", method = RequestMethod.GET)
	public ModelAndView selectSearchPaymentTypeMethod(ModelAndView mv, @RequestParam("paymentstatus") String paymentstatus,
			@RequestParam(name = "page", required = false) String page, @RequestParam("action") String action) {
		// 검색결과에 대한 페이징 처리
		// 출력할 페이지 지정
		int currentPage = 1;
		
		// 전송온 페이지 값이 있다면 추출함
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지당 출력할 목록 갯수 지정
		int limit = 10;

		// 총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
		int listCount = paymentService.selectSearchPaymentStatusCount(paymentstatus.trim());

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "psearchpaymentstatus.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setPaymentstatus(paymentstatus);

		ArrayList<Payment> list = paymentService.selectSearchStatus(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("paymentstatus", paymentstatus);

			mv.setViewName("payment/paymentListView");
		} else {
			mv.setViewName("payment/paymentListView");
		}
		return mv;
	}

	@RequestMapping(value = "psearchdate.do", method = RequestMethod.GET)
	public ModelAndView selectSearchDateMethod(ModelAndView mv, @RequestParam("action") String action,
			@RequestParam(name = "page", required = false) String page, @RequestParam("begin") String begin,
			@RequestParam("end") String end) {

		// 검색결과에 대한 페이징 처리
		// 출력할 페이지 지정
		int currentPage = 1;
		// 전송온 페이지 값이 있다면 추출함
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		// 날짜 검색시 end를 시작보다 24시간 뒤로 세팅
		Calendar c = Calendar.getInstance();
		c.setTime(Date.valueOf(end));
		c.add(Calendar.HOUR, 24);
		java.util.Date endDate = c.getTime();

		Search search = new Search();
		search.setBegin(Date.valueOf(begin));
		search.setEnd(new java.sql.Date(endDate.getTime()));

		// 한 페이지당 출력할 목록 갯수 지정
		int limit = 10;

		// 총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
		int listCount = paymentService.selectSearchDateCount(search);
		logger.info(String.valueOf(listCount));

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "psearchdate.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());

		ArrayList<Payment> list = paymentService.selectSearchDate(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("begin", search.getBegin());
			mv.addObject("end", search.getEnd());

			mv.setViewName("payment/paymentListView");
		} else {
			mv.setViewName("payment/paymentListView");
		}
		return mv;
	}
	
	@RequestMapping(value = "pcancel.do", method = RequestMethod.GET)
	public ModelAndView cancelPaymentMethod(@RequestParam("paymentKey") String paymentKey,
									@RequestParam("cancelReason") String cancelReason,
									@RequestParam(name="page", required=false) String page,
									ModelAndView mv, HttpServletRequest request) {
		logger.info("paymentKey : " + paymentKey + ", cancelReason : " + cancelReason + ", page : " + page);
		
		mv.addObject("paymentKey", paymentKey.trim());
		mv.addObject("cancelReason", cancelReason.trim());
		if(page != null) {
			mv.addObject("page", page);			
		}
		mv.setViewName("payment/erppaymentcancelresultview");
		return mv;
	}
	
	@RequestMapping(value = "pcancelsuccessresult.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String moveCancelPaymentResultViewMethod(@RequestParam("paymentKey") String paymentKey,
									@RequestParam("cancelReason") String cancelReason,
									@RequestParam(name="page", required=false) String page,
									RedirectAttributes re, HttpServletRequest request,
									Model model) {
		
		Search search = new Search();
		search.setPaymentKey(paymentKey);
		search.setCancelReason(cancelReason);
		
		if(paymentService.cancelPayment(search) > 0) {
			if (page != null) {
				re.addAttribute("page", page);				
			}
			return "redirect:plist.do";			
		}else {
			model.addAttribute("message", paymentKey + "에 대한 결제 취소 실패");
			return "common/error";
		}
	}
	
	

	@RequestMapping(value = "payinsert.do", method = RequestMethod.POST)
	public int insertPaymentMethod(Payment payment, Model model, HttpServletRequest request) {
		return 1;
	}

	@RequestMapping(value = "payupdate.do", method = RequestMethod.POST)
	public int updatePaymentMethod(Payment payment, Model model, HttpServletRequest request) {
		return 1;
	}

	@RequestMapping(value = "paydelete.do", method = RequestMethod.POST)
	public int deletePaymentMethod(@RequestParam("paymentno") String paymentId, Model model,
			HttpServletRequest request) {
		return 1;
	}
	
	@RequestMapping(value="itemlist5.do", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody	//리턴하는 jsonString 을 response body에 담아서 보낸다는 의미임
	public String itemlist5Method(HttpServletResponse response) throws IOException {
		//클라이언트로 부터 요청이 오면, jsonString을 별도의 스트림을 열어서 내보낼수도있고
		//또는 뷰리졸버로 리턴하면 등록된 jsonView 가 받아서 내보낼수도 있음
		
		
		ArrayList<Payment> list = paymentService.selectItemList5();
		
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Payment payment : list) {
			//notice 의 각 필드값 저장할 json 객체 생성
			JSONObject job = new JSONObject();
			
			job.put("itemId", payment.getItemId());
			
			job.put("amount", payment.getAmount());
			
			//job를 jarr 에 추가함
			jarr.add(job);
		}
		sendJson.put("nlist",jarr);
		//ajax로 서비스 요청시 클라이언트로 응답하는 방법은 2가지
		// 방법 1: 
		//public void 형 >> 직접 출력스트림을 만들어서 내보냄
		// 방법 2:
		//public String 형 >> 설정된 JsonView 로 내보냄
		
		//리턴되는 json객체의 string 문자열을 등록된 뷰리졸버인 JsonView로 보냄
		return sendJson.toJSONString();
	}
	
}
