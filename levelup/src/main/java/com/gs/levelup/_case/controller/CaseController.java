package com.gs.levelup._case.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gs.levelup._case.model.service.CaseService;
import com.gs.levelup._case.model.vo.Case;
import com.gs.levelup.character.model.service.CharacterService;
import com.gs.levelup.common.FileNameChange;
import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.employee.model.service.EmployeeService;
import com.gs.levelup.employee.model.vo.Employee;
import com.gs.levelup.inventory.model.service.InventoryService;
import com.gs.levelup.inventory.model.vo.Inventory;
import com.gs.levelup.item.model.service.ItemService;
import com.gs.levelup.item.model.vo.Item;
import com.gs.levelup.payment.model.service.PaymentService;
import com.gs.levelup.payment.model.vo.Payment;
import com.gs.levelup.picklog.model.service.PickLogService;
import com.gs.levelup.rodexItems.model.service.RodexItemsService;
import com.gs.levelup.rodexItems.model.vo.RodexItems;

@Controller
public class CaseController {
private static final Logger logger = LoggerFactory.getLogger(CaseController.class);
	
	@Autowired
	private CaseService caseService;
	
	@Autowired
	private ItemService itemService;

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private InventoryService inventoryService;
	
	@Autowired
	private CharacterService characterService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private RodexItemsService rodexItemsService;	

	@Autowired
	private PickLogService pickLogService;

	// 기안 리스트 출력용
	@RequestMapping(value = "clist.do", method = RequestMethod.GET)
	public ModelAndView selectListMethod(@RequestParam(name = "page", required = false) String page, ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지 게시글 10개씩 출력되게 한다면
		int limit = 10;

		// 총 페이지 수 계산을 위한 게시글 총갯수 조회
		int listCount = caseService.selectListCount();
		logger.info(String.valueOf(listCount));

		// 페이지 관련 항목 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "clist.do");
		paging.calculator();

		// 페이지에 출력할 목록 조회해 옴
		ArrayList<Case> list = caseService.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.setViewName("empCase/empCaseListView");
		}
		mv.setViewName("empCase/empCaseListView");
		return mv;
	}
	
	//---------------------------------------------------------
	// My 기안함
	@RequestMapping(value = "mclist.do", method = RequestMethod.GET)
	public ModelAndView selectMyCaseListMethod(ModelAndView mv, @RequestParam("employeeId") String employeeId) {

		// 페이지에 출력할 목록 조회해 옴
		ArrayList<Case> list = caseService.selectMyCaseList(employeeId);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.setViewName("empCase/empMyCaseListView");
		}
		mv.setViewName("empCase/empMyCaseListView");
		return mv;
	}
	
	// --------------------------------------------------------
	// 기안 검색용
	@RequestMapping(value = "csearch.do", method = RequestMethod.GET)
	public String selectSearchMethod(@RequestParam("action") String action,
			@RequestParam(name = "begin", required = false) String begin,
			@RequestParam(name = "end", required = false) String end,
			@RequestParam(name = "keyword", required = false) String keyword,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "type", required = false) String type, Model model, RedirectAttributes re) {

		if (action.equals("writer")) {
			re.addAttribute("action", action);
			re.addAttribute("keyword", keyword);
			re.addAttribute("page", page);
			return "redirect:csearchwritername.do";
		} else if (action.equals("title")) {
			re.addAttribute("action", action);
			re.addAttribute("keyword", keyword);
			re.addAttribute("page", page);
			return "redirect:csearchtitle.do";
		} else if (action.equals("date")) {
			re.addAttribute("action", action);
			re.addAttribute("page", page);
			re.addAttribute("begin", begin);
			re.addAttribute("end", end);
			return "redirect:csearchdate.do";
		} else if (action.equals("type")) {
			re.addAttribute("action", action);
			re.addAttribute("page", page);
			re.addAttribute("type", type);
			return "redirect:csearchtype.do";
		} else {
			model.addAttribute("message", "검색 실패!");
			return "common/error";
		}
	}

	@RequestMapping(value = "csearchwritername.do", method = RequestMethod.GET)
	public ModelAndView selectSearchWriterNameMethod(ModelAndView mv, @RequestParam("action") String action,
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
		int listCount = caseService.selectSearchWriterNameCount(keyword.trim());

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "csearchwritername.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);

		ArrayList<Case> list = caseService.selectSearchWriterName(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);

			mv.setViewName("empCase/empCaseListView");
		} else {
			mv.setViewName("empCase/empCaseListView");
		}
		return mv;
	}

	@RequestMapping(value = "csearchtitle.do", method = RequestMethod.GET)
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
		int listCount = caseService.selectSearchTitleCount(keyword.trim());

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "csearchtitle.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);

		ArrayList<Case> list = caseService.selectSearchTitle(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);

			mv.setViewName("empCase/empCaseListView");
		} else {
			mv.setViewName("empCase/empCaseListView");
		}
		return mv;
	}

	@RequestMapping(value = "csearchtype.do", method = RequestMethod.GET)
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
		int listCount = caseService.selectSearchTypeCount(type.trim());

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "csearchtype.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setType(type);

		ArrayList<Case> list = caseService.selectSearchType(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("type", type);

			mv.setViewName("empCase/empCaseListView");
		} else {
			mv.setViewName("empCase/empCaseListView");
		}
		return mv;
	}

	@RequestMapping(value = "csearchdate.do", method = RequestMethod.GET)
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
		int listCount = caseService.selectSearchDateCount(search);
		logger.info(String.valueOf(listCount));

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "csearchdate.do");
		paging.calculator();

		// 서비스 메소드 호출하고 리턴결과 받기
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());

		ArrayList<Case> list = caseService.selectSearchDate(search);

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("begin", search.getBegin());
			mv.addObject("end", search.getEnd());

			mv.setViewName("empCase/empCaseListView");
		} else {
			mv.setViewName("empCase/empCaseListView");
		}
		return mv;
	}
	

	
	@RequestMapping(value="changeitem.do", method = RequestMethod.GET)
	public ModelAndView changeItemMethod(ModelAndView mv) {
		return mv;
	}
	
	
	
	
	//기안 작성 페이지로 이동(아이템 변경/삭제 기안)
	@RequestMapping("cdcaseform.do")
	public ModelAndView moveitemChDeCaseWritePage(@RequestParam("caseType") String caseType,
													@RequestParam("managerId") String managerId, 												
													Inventory itemdata,		//Original 아이템 정보											
													ModelAndView mv) {
		// 현재 우리가 ITEM TABLE에 가지고 있는 정보를 불러오는 용도
		ArrayList<Inventory> ilist = inventoryService.selectAll();
		// 현재 로그인한 사원의 관리자 정보 불러오는 용도
		Employee manager = employeeService.selectManager(managerId);
		// 기안 테이블에 유저 정보를 넣기위해 캐릭터 TABLE에서 유저 정보를 가져옴
		com.gs.levelup.character.model.vo.Character character = characterService.selectCharacter(itemdata.getCharId());
	
		
		if(caseType.equals("1")) {
			mv.addObject("manager", manager);
			mv.addObject("ilist", ilist);
			mv.addObject("itemdata", itemdata);
			mv.addObject("character", character);
		
			mv.setViewName("empCase/empNewChangeCaseView");
			
		}else if (caseType.equals("2")) {
			mv.addObject("manager", manager);
			mv.addObject("ilist", ilist);
			mv.addObject("itemdata", itemdata);
			mv.addObject("character", character);
			
			mv.setViewName("empCase/empNewDelCaseView");
		}
						
		return mv;
	}
	
	
	//기안 작성 페이지로 이동(아이템 환불 기안)
		@RequestMapping("rfcaseform.do")
		public ModelAndView moveitemRefundCasePage(@RequestParam("caseType") String caseType,
														@RequestParam("managerId") String managerId, 													
														@RequestParam("paymentKey") String paymentKey,	
														@RequestParam("charId") int charId,	
														@RequestParam("uniqueId") long uniqueId,
														ModelAndView mv) {
			
						
			// 현재 우리가 ITEM TABLE에 가지고 있는 정보를 불러오는 용도			
			//ArrayList<Inventory> ilist = inventoryService.selectAll();
			// 현재 로그인한 사원의 관리자 정보 불러오는 용도
			Employee manager = employeeService.selectManager(managerId);
			
			// 기안 테이블에 유저 정보를 넣기위해 캐릭터 TABLE에서 유저 정보를 가져옴
			com.gs.levelup.character.model.vo.Character character = characterService.selectCharacter(charId);
			
			// payment 테이블에서 해당 paymentId의 결재 정보를 가져옴
			Payment payment = paymentService.selectPaymentOne(paymentKey);
			
			// rodexitem 테이블에서 구매한 아이템의 UniqueId를 가진 아이템을 조회해옴 
			RodexItems rodexitem = rodexItemsService.selectRodexItem(payment.getUniqueId());
			
			// 구매한 아이템의 아이템정보를 Item 테이블에서 가져옴
			Item iteminfo = itemService.selectItem(payment.getItemId());
					
			logger.info("selectPayItemPickLog : " + pickLogService.selectPayItemPickLog(uniqueId));
			System.out.println(pickLogService.selectPayItemPickLog(uniqueId));
			
			//uniqueId로 게임 DB pick로그 창에서 구매한 상품을 캐릭터가 수령한 기록이 있는지 확인
			if( pickLogService.selectPayItemPickLog(uniqueId) == 0) {
				mv.addObject("manager", manager);
				mv.addObject("iteminfo", iteminfo);
				mv.addObject("rodexitem", rodexitem);
				mv.addObject("character", character);
				mv.addObject("payment", payment);			
				
				mv.setViewName("empCase/empNewRefundCaseView");
				
			}else if(pickLogService.selectPayItemPickLog(uniqueId) ==1 ){
				mv.addObject("message", "아이템 수령기록이 있으므로 환불이 불가합니다");
				mv.setViewName("common/error");
			
			}	
			return mv;
		}
	
	
	
	//기안 작성페이지 
	@RequestMapping(value="cinsert.do", method = RequestMethod.POST)
	public String insertCaseItemChange(Case _case,											
										@RequestParam(name="upfile", required=false) MultipartFile mfile,
										HttpServletRequest request,
										Model model) {		
	
		//첨부파일이 있을 때 저장 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath("resources/case_upfiles");
		
		if(!mfile.isEmpty()) {
			//전송온 파일이름 추출함
			String fileName = mfile.getOriginalFilename();			
			String renameFileName = null;
			//저장폴더에는 변경된 이름을 저장 처리함
			//파일 이름바꾸기함 : charId + OriginalFilename + 작성날짜.확장자
			if(fileName != null && fileName.length() > 0) {				
				//바꿀 파일명에 대한 문자열 만들기
				renameFileName = _case.getCharId() + "_" + _case.getOriginalItemId() + "_" + FileNameChange.change(fileName, "yyyyMMddHHmmss");
				renameFileName += "." + (mfile.getOriginalFilename()).substring((mfile.getOriginalFilename()).lastIndexOf(".") + 1);
				try {	
					//저장 폴더에 파일명 바꾸기 처리
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "첨부파일 저장 실패!");
					return "common/error";
				}
			}  //파일명 바꾸기
			
			//Case 객체에 첨부파일 정보 저장 처리
			_case.setAttachmentFileName(renameFileName);
			
		} //첨부파일 있을 때	
		
		if(caseService.insertCase(_case) > 0) {  
			//기안 작성 성공 시 기안 리스트 출력 뷰 리다이렉트
			return "redirect:clist.do";
		} else {
			model.addAttribute("message", "기안 작성 실패!");
			return "common/error";
		}
	}
	
	
	
	
	//작성한 기안 디테일 뷰. 승인/ 반려 페이지
	@RequestMapping(value="cdetail.do", method = RequestMethod.GET)
	public ModelAndView selectCaseItemChangeDetail(ModelAndView mv,
												 Case _case,
												 @RequestParam(name="page", required=false) String page) {
		
		//출력할 페이지 
		int currentPage = 1;
		
		if(page != null) {
			currentPage = Integer.parseInt(page);					
		}

		
		Case casedetail = caseService.selectCase(_case.getCaseId());	

		if(casedetail != null) {
			mv.addObject("casedetail", casedetail);
			mv.addObject("currentPage", currentPage);

		
			mv.setViewName("empCase/empCaseDetailView");
		}else {
			mv.addObject("message", "아이템 변경 기안 상세 페이지 보기 실패");
			mv.setViewName("common/error");
		}
		
		
		return mv;
	}
	
	
	
	//변경/삭제 기안 승인 요청처리용
	@RequestMapping(value="caseApprove.do", method = RequestMethod.GET)
	public String updateSaseStatusApprove(@RequestParam("caseId") String caseId,
											@RequestParam("employeeId") String employeeId,
											@RequestParam("charId") int charId,
											HttpServletRequest request, 
											Model model,
											RedirectAttributes re) {
		
		Case _case = caseService.selectCase(caseId);
		logger.info("케이스 불러오기 성공");
		//Inventory intentory = inventoryService.selectCharInventory(charId);
		//logger.info("유저 인벤토리 불러오기 성공");
		
		// 아이템 변경 기안일때
		if(_case.getCaseType().equals("1")) {
			logger.info("아이템 변경 기안임");
			// 인벤토리 서비스 결과에 따라 기안의 상태를 업데이트
				if(inventoryService.updateItemChange(_case) > 0) {
					logger.info("인벤토리 업데이트 성공");
					if(caseService.updateCaseAprrove(_case) > 0) {
						
						re.addAttribute("employeeId", employeeId);
						return "redirect:mclist.do";
						
					}else {
						model.addAttribute("message", "기안 승인 실패");
						return ("common/error");
					}
				}
		// 아이템 삭제 기안일때
		} else if(_case.getCaseType().equals("2")){
			if(inventoryService.deleteItemOne(_case) > 0) {
				logger.info("인벤토리 업데이트(아이템 삭제) 성공");
				if(caseService.updateCaseAprrove(_case) > 0) {
					
					re.addAttribute("employeeId", employeeId);
					return "redirect:mclist.do";
					
				}else {
					model.addAttribute("message", "기안 승인 실패");
					return ("common/error");
				}	
						
		}
		model.addAttribute("message", "아이템 변경/삭제 기안이 아님");
		return ("common/error");
	}
	
	model.addAttribute("message", "기안 승인 과정 실패");
	return ("common/error");
}
	
	
	//환불 기안 승인 요청처리용
		@RequestMapping(value="caserfApprove.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String updateSaseStatusApprove(@RequestParam("caseId") String caseId,
												@RequestParam("employeeId") String employeeId,
												@RequestParam("charId") int charId,
												@RequestParam("paymentKey") String paymentKey,
												@RequestParam("cancelReason") String cancelReason,
												@RequestParam("page") String page,
												HttpServletRequest request, 
												Model model,
												RedirectAttributes re) {
			System.out.println("여기로 오긴 옴?");
			Case _case = caseService.selectCase(caseId);
			//RodexItems rodexItems = rodexItemsService.selectRodexItem(_case.getUniqueId());
			int mailId = rodexItemsService.selectRodexMailId(_case.getUniqueId());
			logger.info("메일 아이디 가져옴");
		//아이템 환불 기안일 때
		if(_case.getCaseType().equals("3")){
			
			logger.info("환불 기안 승인 시스템 시작");
			
			if(rodexItemsService.deleteRodexItemOne(mailId) > 0) { //게임 rodex_items에서 아이템 삭제
				logger.info("게임 DB 아이템 삭제 성공");
				
				if(rodexItemsService.deleteRodexEmailOne(mailId) > 0) { //게임 rodex_emil에서 메일 삭제
					
					logger.info("게임 DB 메일 삭제 성공");
					Search search = new Search();
					search.setPaymentKey(paymentKey);
					search.setCancelReason(cancelReason);
				
					if(paymentService.cancelPayment(search) > 0){ //payment 테이블에서 결제 내역 환불 상태로 업데이트
						
						logger.info("오라클DB 결제내역 업데이트 성공");
				
						if(caseService.updateCaseAprrove(_case) > 0) { //기안 승인상태 업데이트
							
								logger.info("오라클DB 기안 상태 변경 성공");
					
								re.addAttribute("paymentKey", paymentKey);
								re.addAttribute("cancelReason", cancelReason);
								re.addAttribute("page", page);
								return "redirect:pcancel.do";
							
								}else {
									
									model.addAttribute("message", "기안 승인 실패");
									return ("common/error");
							
								}	
						
							}
							model.addAttribute("message", "결제 내역 삭제 실패");
							return ("common/error");			
						}
						model.addAttribute("message", "게임DB rodex_email에서 메일 삭제 실패");
						return ("common/error");
					}	
					
					model.addAttribute("message", "게임DB rodex_items에서 아이템 삭제 실패");
					return ("common/error");
				}
				model.addAttribute("message", "아이템 시스템 시작 실패");
				return ("common/error");
		}


		
/*					
			
			// 아이템 삭제 기안일때
		} else if (_case.getCaseType().equals("2")) {
			// 인벤토리 서비스 결과에 따라 기안의 상태를 업데이트
			
			// 아이템 환불 기안일때
		} else if (_case.getCaseType().equals("3")) {
			// 환불 결과에 따라서 인벤토리 서비스 호출해서
			// 인벤토리 결과에 따라
			// 기안 상태 업데이트
		}
		*/
	

	
	//반려 요청처리용
		@RequestMapping(value="caseReject.do", method = RequestMethod.GET)
		public String updateSaseStatusReject(Case _case, 
											@RequestParam("caseId") String caseId,
											@RequestParam("employeeId") String employeeId,
											HttpServletRequest request, 
											Model model,
											RedirectAttributes re) {
			
			if(caseService.updateCaseReject(caseId) > 0) {
				re.addAttribute("employeeId", employeeId);
				return "redirect:mclist.do";
				
			}else {
				model.addAttribute("message", "기안 승인 실패");
				return ("common/error");
			}
			
		}

		//파일 다운로드 요청 처리용
		@RequestMapping("cfdown.do")
		public ModelAndView fileDownMethod(
								ModelAndView mv, HttpServletRequest request,
								@RequestParam("file") String attachmentFileName) {
			//파일 다운 메소드는 리턴 타입이 ModelAndView로 정해져있음
			
			//게시글 첨부파일 저장폴더 경로 지정
			String savePath = request.getSession().getServletContext().getRealPath("resources/case_upfiles");
			
			//저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
			File file = new File(savePath + "\\" +attachmentFileName);
			
			//파일 다운로드용 뷰로 전달할 정보 저장 처리
			mv.setViewName("empfiledown");
			mv.addObject("file", file);
			
			return mv;
		}
	

	
}
