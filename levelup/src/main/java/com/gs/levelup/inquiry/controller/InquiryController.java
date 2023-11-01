package com.gs.levelup.inquiry.controller;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.inquiry.model.service.InquiryService;
import com.gs.levelup.inquiry.model.vo.Inquiry;

@Controller
public class InquiryController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private InquiryService inquiryService;

	// 뷰 페이지 이동 처리용 ---------------------------------------------------

	// 요청 처리용 ----------------------------------------------------------

	@RequestMapping(value = "ilist.do", method = RequestMethod.GET)
	public String selectListMethod(@RequestParam(name = "page", required = false) String page, Model model) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지 게시글 10개씩 출력되게 한다면
		int limit = 10;

		// 총 페이지 수 계산을 위한 게시글 총갯수 조회
		int listCount = inquiryService.selectListCount();

		// 페이지 관련 항목 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "ilist.do");
		paging.calculator();

		// 페이지에 출력할 목록 조회해 옴
		ArrayList<Inquiry> list = inquiryService.selectList(paging);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);

			return "empInquiry/empInquiryListView";
		} else {
			model.addAttribute("message", currentPage + "페이지 목록 조회 실패!");
			return "common/error";
		}
	}

	@RequestMapping(value = "isearch.do", method = RequestMethod.GET)
	public String selectSearchMethod(@RequestParam("action") String action,
			@RequestParam(name = "begin", required = false) String begin,
			@RequestParam(name = "end", required = false) String end,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "type", required = false) String type, 
			Model model, 
			RedirectAttributes re) {

		if (action.equals("writer")) {
			re.addAttribute("action", action);
			re.addAttribute("keyword", keyword);
			re.addAttribute("page", page);
			return "redirect:isearchid.do";
		} else if (action.equals("title")) {
			re.addAttribute("action", action);
			re.addAttribute("keyword", keyword);
			re.addAttribute("page", page);
			return "redirect:isearchtitle.do";
		} else if (action.equals("date")) {
			re.addAttribute("action", action);
			re.addAttribute("page", page);
			re.addAttribute("begin", begin);
			re.addAttribute("end", end);
			return "redirect:isearchdate.do";
		} else if (action.equals("type")) {
			re.addAttribute("action", action);
			re.addAttribute("page", page);
			re.addAttribute("type", type);
			return "redirect:isearchtype.do";
		} else {
			model.addAttribute("message", "검색 실패!");
			return "common/error";
		}
	}

	@RequestMapping(value = "isearchid.do", method = RequestMethod.GET)
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
		int listCount = inquiryService.selectSearchUserIDCount(keyword.trim());

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "isearchid.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);

		ArrayList<Inquiry> list = inquiryService.selectSearchUserID(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);

			mv.setViewName("empInquiry/empInquiryListView");
		} else {
			mv.setViewName("empInquiry/empInquiryListView");
		}
		return mv;
	}

	@RequestMapping(value = "isearchtitle.do", method = RequestMethod.GET)
	public ModelAndView selectSearchTitleMethod(ModelAndView mv, @RequestParam("action") String action,
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
		int listCount = inquiryService.selectSearchTitleCount(keyword.trim());

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "isearchid.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);

		ArrayList<Inquiry> list = inquiryService.selectSearchTitle(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);

			mv.setViewName("empInquiry/empInquiryListView");
		} else {
			mv.setViewName("empInquiry/empInquiryListView");
		}
		return mv;
	}

	@RequestMapping(value = "isearchtype.do", method = RequestMethod.GET)
	public ModelAndView selectSearchTypeMethod(ModelAndView mv, @RequestParam("type") String type,
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
		int listCount = inquiryService.selectSearchTypeCount(type.trim());

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "isearchtype.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setType(type);

		ArrayList<Inquiry> list = inquiryService.selectSearchType(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("type", type);

			mv.setViewName("empInquiry/empInquiryListView");
		} else {
			mv.setViewName("empInquiry/empInquiryListView");
		}
		return mv;
	}

	@RequestMapping(value = "isearchdate.do", method = RequestMethod.GET)
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
		int listCount = inquiryService.selectSearchDateCount(search);
		logger.info(String.valueOf(listCount));

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "isearchdate.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());

		ArrayList<Inquiry> list = inquiryService.selectSearchDate(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("begin", search.getBegin());
			mv.addObject("end", search.getEnd());

			mv.setViewName("empInquiry/empInquiryListView");
		} else {
			mv.setViewName("empInquiry/empInquiryListView");
		}
		return mv;
	}
	
	//문의글 디테일 뷰
		@RequestMapping(value="idetail.do", method=RequestMethod.GET)
		public ModelAndView moveInquiryDetailMethod(
										@RequestParam("iid") String inquiryId,
										@RequestParam("page") String page,
										@RequestParam("userId") String userId,
										ModelAndView mv){
			//출력할 페이지 
			int currentPage = 1;
			
			//전송할 페이지가 있다면 추출
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
		
			Inquiry inquiry = inquiryService.selectInquiry(inquiryId);
			ArrayList<Inquiry> list = inquiryService.selectUserPreviousInquiry(userId);
			
			if(inquiry != null) {
				mv.addObject("inquiry", inquiry);
				mv.addObject("currentPage", currentPage);
				mv.addObject("list", list);
				
				mv.setViewName("empInquiry/empInquiryDetailView");
			}else {
				mv.addObject("message", "문의글 상세보기 실패");
				mv.setViewName("common/error");
			}

			return mv;
		}

		//문의글 디테일 뷰 / 답변 작성 or 수정 작업
		@RequestMapping(value = "iupdate.do", method = RequestMethod.POST)
		public String updateInquiryAnswerMethod(Inquiry inquiry, Model model, 
												HttpServletRequest request,
												@RequestParam("employeeId") String employeeId,
												@RequestParam("employeeName") String employeeName,
												@RequestParam("inquiryId") String inquiryId,
												@RequestParam("userId") String userId,
												@RequestParam("page") String page) {
			int currentPage = 1;
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			if(inquiryService.updateInquiryAnswer(inquiry) > 0 ) {
				//답변 달기 성공 시 상세 페이지로 이동
				model.addAttribute("iid", inquiryId);
				model.addAttribute("userId", userId);
				model.addAttribute("page", currentPage);
				return "redirect:idetail.do";
			}else {			
				model.addAttribute("message", "답변 등록 실패");
				return  "common/error";
			}
		}
		
		//문의글 디테일 뷰 / 답변 수정 페이지로 이동 컨트롤러
		@RequestMapping("ansfixview.do")
		public ModelAndView moveAnswerFixView(@RequestParam("employeeId") String employeeId,
											@RequestParam("employeeName") String employeeName,
											@RequestParam("inquiryId") String inquiryId,
											@RequestParam("userId") String userId,
											@RequestParam("page") String page,
											ModelAndView mv) {
			//출력할 페이지 
				int currentPage = 1;
				
				//전송할 페이지가 있다면 추출
				if(page != null) {
					currentPage = Integer.parseInt(page);
				}
			
				Inquiry inquiry = inquiryService.selectInquiry(inquiryId);
				ArrayList<Inquiry> list = inquiryService.selectUserPreviousInquiry(userId);
				
				if(inquiry != null) {
					mv.addObject("inquiry", inquiry);
					mv.addObject("currentPage", currentPage);
					mv.addObject("list", list);
					
					mv.setViewName("empInquiry/empInquiryAnserFixView");
					
				}else {
					mv.addObject("message", "문의글 답변 수정창 불러오기 실패");
					mv.setViewName("common/error");
				}
		
				return mv;
			
			
			
		}
	
	//파일 다운로드 요청 처리용
	@RequestMapping("ifdown.do")
	public ModelAndView fileDownMethod(
							ModelAndView mv, HttpServletRequest request,
							@RequestParam("file") String attachmentFileName) {
		//파일 다운 메소드는 리턴 타입이 ModelAndView로 정해져있음
		
		//게시글 첨부파일 저장폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/inquiry_files");
		
		//저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
		File file = new File(savePath + "\\" +attachmentFileName);
		
		//파일 다운로드용 뷰로 전달할 정보 저장 처리
		mv.setViewName("empfiledown");
		mv.addObject("file", file);
		
		return mv;
	}
	
	//문의사항 삭제용
	@RequestMapping("deleteinquiry.do")
	public String deleteinquiryMethod(
			Model model,
			@RequestParam(value = "page", required=false) int nowPage,
			@RequestParam("iid") String inquiryId) {
		
		logger.info("deleteinquiry.do : " + inquiryId);
		
		if(inquiryService.deleteInquiry(inquiryId) > 0) {
			model.addAttribute("page", nowPage);
			model.addAttribute("message", "삭제되었습니다.");
			return "redirect:uhelp.do";
		}else {
			model.addAttribute("message", "새 공지글 등록 실패!");
			return "common/error";
		}
	}
	
	
	
	
	
}
