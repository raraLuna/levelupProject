package com.gs.levelup.notice.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gs.levelup.common.FileNameChange;
import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.employee.model.vo.Employee;
import com.gs.levelup.notice.model.service.NoticeService;
import com.gs.levelup.notice.model.vo.Notice;



@Controller
public class NoticeController {
	//이 컨트롤러 안의 메소드들이 구동되는지, 값이 잘 전달되었는지 확인을 위한 로그 객체를 생성
		private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private static final String String = null;
		
		@Autowired
		private NoticeService noticeService;
		
		//뷰 페이지 내보내기용 -----------------------------------
		//새 공지글 등록 페이지 이동 처리용
		@RequestMapping("nwrite.do")
		public String moveWritePage(HttpServletRequest request) {
			String previousPage = request.getHeader("Referer"); // 현재 페이지로 이동하기 전 페이지의 URL
		    HttpSession session = request.getSession();
		    String listPage = (String)session.getAttribute("listPage");
		    session.setAttribute("listPage", previousPage);
		    session.setAttribute("previousPage", previousPage);
		    
		    
		    return "notice/nwrite";
		}
		
		//새 팀 공지글 등록 페이지 이동 처리용
		@RequestMapping("ntwrite.do")
		public String moveTeamWritePage(HttpServletRequest request) {
			String previousPage = request.getHeader("Referer"); // 현재 페이지로 이동하기 전 페이지의 URL
		    HttpSession session = request.getSession();
		    String listPage = (String)session.getAttribute("listPage");
		    session.setAttribute("listPage", previousPage);
		    session.setAttribute("previousPage", previousPage);
		    
		    
		    return "notice/ntwrite";
		}
				
		//새 부서 공지글 등록 페이지 이동 처리용
		@RequestMapping("ndwrite.do")
		public String moveDeptWritePage(HttpServletRequest request) {
			String previousPage = request.getHeader("Referer"); // 현재 페이지로 이동하기 전 페이지의 URL
		    HttpSession session = request.getSession();
		    String listPage = (String)session.getAttribute("listPage");
		    session.setAttribute("listPage", previousPage);
		    session.setAttribute("previousPage", previousPage);
		    
		    
		    return "notice/ndwrite";
		}
		
		//공지글 수정페이지로 이동 처리용
		@RequestMapping("nmoveup.do")
		public ModelAndView moveUpdatePage(HttpServletRequest request,
				@RequestParam("noticeId") String noticeId, ModelAndView mv) {
			//수정페이지에 출력할 공지글 조회해 옴
			Notice notice = noticeService.selectOne(noticeId);
			
			if(notice != null) {
				String previousPage = request.getHeader("Referer"); // 현재 페이지로 이동하기 전 페이지의 URL
			    HttpSession session = request.getSession();
			    session.setAttribute("previousPage", previousPage);
				mv.addObject("notice", notice);
				mv.setViewName("notice/nupdate");
				
			}else {
				mv.addObject("message", noticeId + "번 공지글 수정페이지로 이동 실패!");
				mv.setViewName("common/error");
			}
			
			return mv;
		}
		
		
		
		//요청 결과 처리용 ----------------------------------------
		//공지사항 전체 목록보기 요청 처리용
		@RequestMapping("nlist.do")
		public String noticeListMethod( 
			@RequestParam(name="page", required=false) String page, 
			@RequestParam(name="limit", required=false) String slimit, 
			HttpSession session,
			HttpServletRequest request,
			Model model) {
			Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");
			String teamId = loginEmployee.getTeamId();
			String departmentId = loginEmployee.getDepartmentId();
			String employeeId = loginEmployee.getEmployeeId();
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//한 페이지 공지 10개씩 출력되게 한다면
		int ttlimit = 10;
		if (slimit != null) {
			ttlimit = Integer.parseInt(slimit);
		}
		
		//총 페이지 수 계산을 위한 공지글 총 갯수 조회
		// 이전 페이지와 리스트 페이지 세션 제거
		session.removeAttribute("previousPage");
		session.removeAttribute("listPage");
		session.setAttribute("Page", null);
		session.setAttribute("listPage", request.getRequestURL().toString());
		session.setAttribute("departmentId", departmentId);
		session.setAttribute("teamId", teamId);
		session.setAttribute("employeeId", employeeId);
		
		int listCount = noticeService.selectListCount();
		Paging paging = new Paging(listCount, currentPage, ttlimit, "nlist.do");
		paging.calculator();
		
		ArrayList<Notice> list = noticeService.selectList(paging);
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", ttlimit);
			model.addAttribute("departmentId", departmentId);
			model.addAttribute("teamId", teamId);
			model.addAttribute("employeeId", employeeId);
			
			
			return "notice/noticeList";
		}else {
			model.addAttribute("message", currentPage + "페이지 목록 조회 실패!");
			return "common/error";
		}
			
		}
		
		//공지사항 팀 목록보기 요청 처리용
		@RequestMapping("ntlist.do")
		public String noticeTListMethod( 
			@RequestParam(name="page", required=false) String page, 
			@RequestParam(name="limit", required=false) String tlimit,
			HttpSession session,
			HttpServletRequest request,
			Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		// 이전 페이지와 리스트 페이지 세션 제거
		session.removeAttribute("previousPage");
		session.removeAttribute("listPage");
		session.setAttribute("Page", "ntlist");
		session.setAttribute("listPage", request.getRequestURL().toString());

		Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");

		String departmentId = loginEmployee.getDepartmentId();
		String teamId = loginEmployee.getTeamId();
		session.setAttribute("teamId", teamId);
		session.setAttribute("departmentId", departmentId);
		//한 페이지 공지 10개씩 출력되게 한다면
		int ttlimit = 10;
		if (tlimit != null) {
			ttlimit = Integer.parseInt(tlimit);
		}
		
		//총 페이지 수 계산을 위한 공지글 총 갯수 조회
		int listCount = noticeService.selectTListCount(teamId, departmentId);
		Paging paging = new Paging(listCount, currentPage, ttlimit, "ntlist.do");
		paging.calculator();
		
		ArrayList<Notice> tlist = noticeService.selectTList(paging, teamId, departmentId);
		
		if(tlist != null && tlist.size() > 0) {
			model.addAttribute("tlist", tlist);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", ttlimit);
			return "notice/noticeTList";
		}else {
			model.addAttribute("message", currentPage + "페이지 목록 조회 실패!");
			return "common/error";
		}
			
		}
		
		//공지사항 부서 목록보기 요청 처리용
				@RequestMapping("ndlist.do")
				public String noticeDListMethod( 
					@RequestParam(name="page", required=false) String page, 
					@RequestParam(name="limit", required=false) String dlimit,
					HttpSession session,
					HttpServletRequest request,
					Model model) {
				int currentPage = 1;
				if (page != null) {
					currentPage = Integer.parseInt(page);
				}
				// 이전 페이지와 리스트 페이지 세션 제거
				session.removeAttribute("previousPage");
				session.removeAttribute("listPage");
				session.setAttribute("Page", "ndlist");
				session.setAttribute("listPage", request.getRequestURL().toString());
				
				Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");
				String departmentId = loginEmployee.getDepartmentId();
				session.setAttribute("departmentId", departmentId);
				session.setAttribute("teamId", null);
				//한 페이지 공지 10개씩 출력되게 한다면
				int ddlimit = 10;
				if (dlimit != null) {
					ddlimit = Integer.parseInt(dlimit);
				}
				
				//총 페이지 수 계산을 위한 공지글 총 갯수 조회
				int listCount = noticeService.selectDListCount(departmentId);
				Paging paging = new Paging(listCount, currentPage, ddlimit, "ndlist.do");
				paging.calculator();
				
				ArrayList<Notice> dlist = noticeService.selectDList(paging, departmentId);
				
				if(dlist != null && dlist.size() > 0) {
					model.addAttribute("dlist", dlist);
					model.addAttribute("paging", paging);
					model.addAttribute("currentPage", currentPage);
					model.addAttribute("limit", ddlimit);
					return "notice/noticeDList";
				}else {
					model.addAttribute("message", currentPage + "페이지 목록 조회 실패!");
					return "common/error";
				}
					
				}
		//공지사항 입력
		@RequestMapping(value="ninsert.do", method=RequestMethod.POST)
		public String noticeInsertMethod(Notice notice, Model model, HttpServletRequest request, 
		        @RequestParam(name = "ofile", required = false) MultipartFile mfile) {
		    logger.info("ninsert.do : " + notice);
		    
		   
		    //공지사항 첨부파일 저장 폴더 경로 지정
		    String savePath = request.getSession().getServletContext().getRealPath(
		            "resources/notice_upfiles");

		    //첨부파일이 있을 때
		    if(!mfile.isEmpty()) {
		        //전송온 파일이름 추출함
		        String fileName = mfile.getOriginalFilename();
		        String renameFileName = null;
		        
		        //저장폴더에는 변경된 이름을 저장 처리함
		        //파일 이름바꾸기함 : 년월일시분초.확장자
		        if(fileName != null && fileName.length() > 0) {                
		            //바꿀 파일명에 대한 문자열 만들기
		            renameFileName = FileNameChange.change2(fileName, "yyyyMMddHHmmss");
		            logger.info("첨부파일명 확인 : " + fileName + ", " + renameFileName);
		            try {    
		                //저장 폴더에 파일명 바꾸기 처리
		                mfile.transferTo(new File(savePath + "\\" + renameFileName));
		            
		            }catch(Exception e) {
		                e.printStackTrace();
		                model.addAttribute("message", "첨부파일 저장 실패!");
		                return "common/error";
		            }
		        }  //파일명 바꾸기
		        //notice 객체에 첨부파일 정보 저장 처리
		        notice.setAttachementFilename(fileName);
		        notice.setRenameFilename(renameFileName);
		    } //첨부파일 있을 때        
		    
		    if(noticeService.insertNotice(notice) > 0) {
		        HttpSession session = request.getSession();
		        String previousPage = (String) session.getAttribute("previousPage");
		        if (previousPage != null) {
		            return "redirect:" + previousPage;
		        } else {
		            return "redirect:nlist.do"; // 기본 리디렉션 페이지
		        }
		    } else {
		        model.addAttribute("message", "새 공지글 등록 실패!");
		        return "common/error";
		    }
		}
		
		//공지글 상세보기 요청 처리용 
		@RequestMapping("ndetail.do")
		public ModelAndView noticeDetailMethod(
				@RequestParam("noticeId") String noticeId, ModelAndView mv, HttpSession session, HttpServletRequest request) {
			
			String listPage = (String)session.getAttribute("listPage");
			String previousPage = request.getHeader("Referer");
			session.setAttribute("previousPage", previousPage);
			session.getAttribute("listPage");
			if (session.getAttribute("listPage") == null) {
			    session.setAttribute("listPage", previousPage);
			}
			
			Notice notice = noticeService.selectOne(noticeId);
			noticeService.updateReadCount(noticeId);
			
			if(notice != null) {
				mv.addObject("notice", notice);
				Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");
				if(loginEmployee != null && listPage.toString().contains("nlist") && notice.getEmployeeId().equals(loginEmployee.getEmployeeId()) && (loginEmployee.getRankId().equals("jdirec") || loginEmployee.getRankId().equals("direc") || loginEmployee.getRankId().equals("ceo"))) {
					mv.setViewName("notice/nAdminDetail");}
				else if(loginEmployee != null && listPage.toString().contains("ntlist") && notice.getEmployeeId().equals(loginEmployee.getEmployeeId()) || loginEmployee.getRankId().equals("sman") || loginEmployee.getRankId().equals("jdirec") || loginEmployee.getRankId().equals("direc") || loginEmployee.getRankId().equals("ceo") || notice.getEmployeeId().equals(loginEmployee.getEmployeeId())) {
					mv.setViewName("notice/nAdminDetail");}
				else if(loginEmployee != null && listPage.toString().contains("ndlist") && notice.getEmployeeId().equals(loginEmployee.getEmployeeId()) || loginEmployee.getRankId().equals("sman") || loginEmployee.getRankId().equals("jdirec") || loginEmployee.getRankId().equals("direc") || loginEmployee.getRankId().equals("ceo") || notice.getEmployeeId().equals(loginEmployee.getEmployeeId())) {
					mv.setViewName("notice/nAdminDetail");
				}else {
					mv.setViewName("notice/ndetail");
				}
			}else {
				mv.addObject("message", noticeId + "번 공지글 상세보기 조회 실패!");
				mv.setViewName("common/error");
			}
			
			return mv;
		}
		
		//첨부파일 다운로드 요청 처리용
		@RequestMapping("nfdown.do")
		public ModelAndView fileDownMethod(
				ModelAndView mv, HttpServletRequest request,
				@RequestParam("ofile") String attachementFilename,
				@RequestParam("rfile") String renameFilename) {
			//파일 다운 메소드는 리턴 타입이 ModelAndView 로 정해져 있음
			
			//공지사항 첨부파일 저장 폴더 경로 지정
			String savePath = request.getSession().getServletContext().getRealPath(
					"resources/notice_upfiles");
			
			//저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
			File renameFile = new File(savePath + "\\" + renameFilename);
			//파일 다운 시 브라우저로 내보낼 원래 파일 이름에 대한 파일 객체 생성함
			File originFile = new File(attachementFilename);
			
			//파일 다운로드용 뷰로 전달할 정보 저장 처리
			mv.setViewName("filedown");	//등록된 파일다운로드용 뷰클래스의 id명
			mv.addObject("renameFile", renameFile);
			mv.addObject("originFile", originFile);
			
			return mv;
		}
		
		//공지글 수정 요청 처리용 (파일 업로드 기능 사용
		@RequestMapping(value="nupdate.do", method=RequestMethod.POST)
		public String noticeUpdateMethod(Notice notice, Model model, 
				HttpServletRequest request,
				HttpSession session,
				@RequestParam(name="upfile", required=false) MultipartFile mfile) {
			logger.info("nupdate.do : " + notice);
			String previousPage = (String)session.getAttribute("previousPage");
			session.setAttribute("previousPage", previousPage);
			//공지사항 첨부파일 저장 폴더 경로 지정
			String savePath = request.getSession().getServletContext().getRealPath(
					"resources/notice_upfiles");
			
			//첨부파일이 변경된 경우의 처리 --------------------------------------------------------
			//1. 원래 첨부파일이 있는데 '파일삭제'를 선택한 경우
			//   또는 원래 첨부파일이 있는데 새로운 첨부파일이 업로드된 경우
			if(notice.getAttachementFilename() != null || !mfile.isEmpty()) {
				//저장 폴더에서 파일 삭제함
				new File(savePath + "\\" + notice.getRenameFilename()).delete();
				//notice 안의 파일정보도 제거함
				notice.setAttachementFilename(null);
				notice.setRenameFilename(null);
			}
			
			//2. 새로운 첨부파일이 있을 때 (공지글 첨부파일은 1개임)
			if(!mfile.isEmpty()) {			
				//전송온 파일이름 추출함
				String fileName = mfile.getOriginalFilename();
				String renameFileName = null;
				
				//저장폴더에는 변경된 이름을 저장 처리함
				//파일 이름바꾸기함 : 년월일시분초.확장자
				if(fileName != null && fileName.length() > 0) {				
					//바꿀 파일명에 대한 문자열 만들기
					renameFileName = FileNameChange.change2(fileName, 	"yyyyMMddHHmmss");
					logger.info("첨부파일명 확인 : " + fileName + ", " + renameFileName);
					try {	
						//저장 폴더에 파일명 바꾸기 처리
						mfile.transferTo(new File(savePath + "\\" + renameFileName));
					
					}catch(Exception e) {
						e.printStackTrace();
						model.addAttribute("message", "첨부파일 저장 실패!");
						return "common/error";
					}
				}  //파일명 바꾸기
				//notice 객체에 첨부파일 정보 저장 처리
				notice.setAttachementFilename(fileName);
				notice.setRenameFilename(renameFileName);
			} //첨부파일 있을 때	
			
			if(noticeService.updateNotice(notice) > 0) {
				
	            return "redirect:" + previousPage;
		            
			}else {
				model.addAttribute("message", notice.getNoticeId() + "번 공지 수정 실패!");
				return "common/error";
			}
		}
		
		// 공지글 삭제 요청 처리용
		@RequestMapping("ndelete.do")
		public String noticeDeleteMethod(
		    @RequestParam("noticeId") String noticeId,
		    @RequestParam(name="rfile", required=false) String renameFilename,
		    HttpServletRequest request, Model model, HttpSession session) {

		    // 이전 페이지 URL을 가져옴
			String listPage = (String)session.getAttribute("listPage");
			
		    if(noticeService.deleteNotice(noticeId) > 0) {
		        // 공지글 삭제 성공시 저장 폴더에 있는 첨부파일도 삭제함
		        if(renameFilename != null) {
		            // 공지사항 첨부파일 저장 폴더 경로 지정
		            String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");
		            // 저장 폴더에서 파일 삭제함
		            new File(savePath + "\\" + renameFilename).delete();
		        }

		            return "redirect:" + listPage;
		        
		    } else {
		        model.addAttribute("message", noticeId + "번 공지 삭제 실패!");
		        return "common/error";
		    }
		}

		
		//공지글 제목 검색용 (페이징 처리 포함)
		@RequestMapping(value="nsearchTitle.do", method=RequestMethod.GET)
		public ModelAndView noticeSearchTitleMethod(
				@RequestParam("action") String action, 
				@ModelAttribute Search search, // Use @ModelAttribute to receive the search object
				@RequestParam(name="limit", required=false) String slimit,
				@RequestParam(name="page", required=false) String page,
				HttpServletRequest request,
				ModelAndView mv) {
			HttpSession session = request.getSession();
			String previousPage = request.getHeader("Referer"); // 현재 페이지로 이동하기 전 페이지의 URL
		    String listPage = (String)session.getAttribute("listPage");
		    String Page = (String)session.getAttribute("Page");
		    
		    session.setAttribute("listPage", listPage);
		    session.setAttribute("Page", Page);
		    
		    Employee loginEmployee = (Employee)session.getAttribute("loginEmployee");
		    
			String departmentId = loginEmployee.getDepartmentId();
		    String teamId = loginEmployee.getTeamId();
			
			
			//검색 결과에 대한 페이징 처리
			//출력할 페이지 지정
			int currentPage = 1;
			//전송온 페이지 값이 있다면 추출
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			//한 페이지당 출력할 목록 갯수 지정
			int limit = 10;
			//전송 온 limit 값이 있다면 
			if(slimit != null) {
				limit = Integer.parseInt(slimit);
			}

			
			//부서리스트 검색인 경우
			if(listPage.toString().contains("ndlist")) {
				// 총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
			    int listCount = noticeService.selectSearchTitleCount(search);

			    // 뷰 페이지에 사용할 페이징 관련 값 계산 처리
			    Paging paging = new Paging(listCount, currentPage, limit, "nsearchTitle.do");
			    paging.calculator();
				

				
			// 서비스 메소드 호출하고 리턴 결과 받기
		    
		    search.setStartRow(paging.getStartRow());
		    search.setEndRow(paging.getEndRow());
		    search.setTeamId(null); // Team ID 설정
		    search.setDepartmentId(departmentId); // Department ID 설정

		    ArrayList<Notice> list = noticeService.selectSearchTitle(search);
			
			//받은 결과에 따라 성공/실패 페이지 내보내기
			if(list != null && list.size() > 0) {
				
				mv.addObject("dlist", list);
				mv.addObject("paging", paging);
				mv.addObject("currentPage", currentPage);
				mv.addObject("limit", limit);
				mv.addObject("action", action);
				mv.addObject("keyword", search.getKeyword());
				mv.setViewName("notice/noticeDList");
				
			}else {
				mv.addObject("message", action + "에 대한 " 
								+ search.getKeyword() + " 검색 결과가 존재하지 않습니다.");
				mv.setViewName("common/error");
			}
			
			return mv;
			}
			
			//팀리스트 검색인 경우
			if(listPage.toString().contains("ntlist")) {
				// 총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
			    int listCount = noticeService.selectSearchTitleCount(search);

			    // 뷰 페이지에 사용할 페이징 관련 값 계산 처리
			    Paging paging = new Paging(listCount, currentPage, limit, "nsearchTitle.do");
			    paging.calculator();
				
				// 서비스 메소드 호출하고 리턴 결과 받기
			    search.setStartRow(paging.getStartRow());
			    search.setEndRow(paging.getEndRow());
			    search.setTeamId(teamId); // Team ID 설정
			    search.setDepartmentId(departmentId); // Department ID 설정

			    ArrayList<Notice> list = noticeService.selectSearchTitle(search);
			
			//받은 결과에 따라 성공/실패 페이지 내보내기
			if(list != null && list.size() > 0) {
				
				mv.addObject("tlist", list);
				mv.addObject("paging", paging);
				mv.addObject("currentPage", currentPage);
				mv.addObject("limit", limit);
				mv.addObject("action", action);
				mv.addObject("keyword", search.getKeyword());
				mv.setViewName("notice/noticeTList");
				
			}else {
				mv.addObject("message", action + "에 대한 " 
								+ search.getKeyword() + " 검색 결과가 존재하지 않습니다.");
				mv.setViewName("common/error");
			}
			
			return mv;
			}
			//전체 공지 검색 리스트인 경우
			else {
				// 총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
			    int listCount = noticeService.selectSearchTitleCountD(search);

			    // 뷰 페이지에 사용할 페이징 관련 값 계산 처리
			    Paging paging = new Paging(listCount, currentPage, limit, "nsearchTitle.do");
			    paging.calculator();
			    
				// 서비스 메소드 호출하고 리턴 결과 받기
			    search.setStartRow(paging.getStartRow());
			    search.setEndRow(paging.getEndRow());
			    search.setTeamId(null); // Team ID 설정
			    search.setDepartmentId(null); // Department ID 설정

			    ArrayList<Notice> list = noticeService.selectSearchTitle(search);
				//받은 결과에 따라 성공/실패 페이지 내보내기
				if(list != null && list.size() > 0) {
					mv.addObject("list", list);
					mv.addObject("paging", paging);
					mv.addObject("currentPage", currentPage);
					mv.addObject("limit", limit);
					mv.addObject("action", action);
					mv.addObject("keyword", search.getKeyword());
					mv.setViewName("notice/noticeList");
					
				}else {
					mv.addObject("message", action + "에 대한 " 
									+ search.getKeyword() + " 검색 결과가 존재하지 않습니다.");
					mv.setViewName("common/error");
				}
				
				return mv;
				
			}
		}
		
		//공지글 내용 검색용 (페이징 처리 포함)
		@RequestMapping(value="nsearchContent.do", method=RequestMethod.POST)
		public ModelAndView noticeSearchContentMethod(
				@RequestParam("action") String action, 
				@RequestParam("keyword") String keyword,
				@RequestParam(name="limit", required=false) String slimit,
				@RequestParam(name="page", required=false) String page,
				ModelAndView mv) {
			
			//검색 결과에 대한 페이징 처리
			//출력할 페이지 지정
			int currentPage = 1;
			//전송온 페이지 값이 있다면 추출
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			//한 페이지당 출력할 목록 갯수 지정
			int limit = 10;
			//전송 온 limit 값이 있다면 
			if(slimit != null) {
				limit = Integer.parseInt(slimit);
			}
			
			//총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
			int listCount = noticeService.selectSearchContentCount(keyword);
			
			//뷰 페이지에 사용할 페이징 관련 값 계산 처리
			Paging paging = new Paging(listCount, currentPage, limit, "nsearchContent.do");
			paging.calculator();
			
			
			//서비스 메소드 호출하고 리턴결과 받기
			Search search = new Search();
			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());
			search.setKeyword(keyword);
			
			ArrayList<Notice> list = noticeService.selectSearchContent(search);
			
			//받은 결과에 따라 성공/실패 페이지 내보내기
			if(list != null && list.size() > 0) {
				mv.addObject("list", list);
				mv.addObject("paging", paging);
				mv.addObject("currentPage", currentPage);
				mv.addObject("limit", limit);
				mv.addObject("action", action);
				mv.addObject("keyword", keyword);
				mv.setViewName("notice/noticeList");
			}else {
				mv.addObject("message", action + "에 대한 " 
								+ keyword + " 검색 결과가 존재하지 않습니다.");
				mv.setViewName("common/error");
			}
			
			return mv;
			
		}
		
		//공지글 등록날짜로 검색용 (페이징 처리 포함)
		@RequestMapping(value="nsearchDate.do", method=RequestMethod.POST)
		public ModelAndView noticeSearchDateMethod(
			SearchDate searchDate,
			@RequestParam("action") String action, 
			@RequestParam(name="limit", required=false) String slimit,
			@RequestParam(name="page", required=false) String page,
			ModelAndView mv) {
		
			//검색 결과에 대한 페이징 처리
			//출력할 페이지 지정
			int currentPage = 1;
			//전송온 페이지 값이 있다면 추출
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			//한 페이지당 출력할 목록 갯수 지정
			int limit = 10;
			//전송 온 limit 값이 있다면 
			if(slimit != null) {
				limit = Integer.parseInt(slimit);
			}
			
			//총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
			int listCount = noticeService.selectSearchDateCount(searchDate);
			
			//뷰 페이지에 사용할 페이징 관련 값 계산 처리
			Paging paging = new Paging(listCount, currentPage, limit, "nsearchDate.do");
			paging.calculator();
			
			
			//서비스 메소드 호출하고 리턴결과 받기
			Search search = new Search();
			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());
			search.setBegin(searchDate.getBegin());
			search.setEnd(searchDate.getEnd());
			
			ArrayList<Notice> list = noticeService.selectSearchDate(search);
			
			//받은 결과에 따라 성공/실패 페이지 내보내기
			if(list != null && list.size() > 0) {
				mv.addObject("list", list);
				mv.addObject("paging", paging);
				mv.addObject("currentPage", currentPage);
				mv.addObject("limit", limit);
				mv.addObject("action", action);
				mv.setViewName("notice/noticeList");
				mv.addObject("begin", searchDate.getBegin());
				mv.addObject("end", searchDate.getEnd());
			}else {
				mv.addObject("message", action + "에 대한 " + searchDate.getBegin() + "부터 "
						+ searchDate.getEnd() + " 기간 사이의 게시글이 존재하지 않습니다.");
				mv.setViewName("common/error");
			}
			
			return mv;
			
		}
		
		@RequestMapping(value="notices5.do", method=RequestMethod.POST)
		@ResponseBody
		public String noticeNewTop3Method(HttpServletResponse response, 
				@RequestParam("keyword") String keyword) throws UnsupportedEncodingException{
			//ajax 요청시 return 방법은 여러가지가 있음
			//response 객체 이용시에는 2가지중 선택 가능
			//1. 출력 스트림으로 응답하는 방법 (아이디 중복체크 예)
			//2. 뷰리졸버로 리턴하는 방법 : response body 에 내보낼 값을 저장함
			
			//최근 등록된 공지글 3개 조회해 옴
			ArrayList<Notice> list = noticeService.selectNotices5(keyword);
			
			//전송용 json 객체 준비
			JSONObject sendJson = new JSONObject();
			//list 저장할 json 배열 객체 준비
			JSONArray jarr = new JSONArray();
			
			for(Notice notice : list) {
				//notice 의 각 필드값 저장할 json 객체 생성
				JSONObject job = new JSONObject();
				
				job.put("title", URLEncoder.encode(notice.getNoticeTitle(), "UTF-8"));
				
				job.put("date", notice.getEditDate().toString());
				
				job.put("attachementFilename", notice.getAttachementFilename());
				
				job.put("noticeId", notice.getNoticeId());
				
				//job를 jarr 에 추가함
				jarr.add(job);
			}
			sendJson.put("nlist",jarr);
			
			return sendJson.toJSONString();
		}

		
}

