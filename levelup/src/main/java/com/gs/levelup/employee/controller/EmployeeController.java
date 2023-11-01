package com.gs.levelup.employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.employee.controller.EmployeeController;
import com.gs.levelup.employee.model.service.EmployeeService;
import com.gs.levelup.employee.model.vo.Employee;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployeeController {
	// 이 컨트롤러 안의 메소드들이 구동되는지, 값이 잘 전달되었는지 확인을 위한 로그 객체를 생성
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	// Service 연결 처리 : 자동 DI 퍼리
	@Autowired
	private EmployeeService employeeService;
	// 스프링에서는 부모 인터페이스 타입으로 레퍼런스 선언함 : 실행시 후손의 오버라이딩 된 메소드를 연결함

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 웹 서비스 요청 하나당 메소드 하나씩 작성하는 방식임 ****************************************
	// 뷰 페이지 내보내기용 메소드
	@RequestMapping(value = "eloginPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String moveLoginPage() {
		return "empmember/empLoginPage";
	}

	// 회원가입 페이지 내보내기용
	@RequestMapping("enrollEmppage.do")
	public String moveEnrollPage() {
		return "employee/insertEmployee";
	}

	@RequestMapping(value = "elogin.do", method = RequestMethod.POST)
	public String loginMethod(Employee employee, HttpSession session, SessionStatus status, Model model) {
		Employee loginEmployee = employeeService.selectEmployee(employee.getEmployeeEmail());

		if(loginEmployee != null && 
				this.bcryptPasswordEncoder.matches(
						employee.getEmployeePwd(), loginEmployee.getEmployeePwd())) {
			session.setAttribute("loginEmployee", loginEmployee);
			status.setComplete();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 실패!, 아이디 및 비밀번호를 확인 해주세요");
			return "common/error";
		}
	}
	
	@RequestMapping(value = "empenroll.do", method = RequestMethod.POST)
	public String empenrollMethod(Model model, 
			Employee emp) {
		
		emp.setEmployeePwd(bcryptPasswordEncoder.encode(emp.getEmployeePwd()));
		
		if(employeeService.insertEmployee(emp) > 0) {
			model.addAttribute("message", "사원이 등록되었습니다.");
			return "employee/insertEmployee";
		}else {
			model.addAttribute("message", "사원등록중 오류 발생 개발팀에 문의바람.");
			return "employee/insertEmployee";
		}
		
		
	}

	// 로그아웃 처리용 메소드
	// 전송방식이 get 이면 , method 속성 생략 가능함, method 속성 생략시 value 속성도 표기 생략함
	@RequestMapping("elogout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
			return "redirect:eloginPage.do";
		} else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
			return "common/error";
		}
	}

	// ajax 통신으로 아이디 중복체크요청 처리용 메소드
	@RequestMapping(value = "eidchk.do", method = RequestMethod.POST)
	public void dupCheckIdMethod(@RequestParam("userid") String userid, HttpServletResponse response)
			throws IOException {
		// @RequestParam("전송온이름") 자료형 값저장변수명
		// 메소드의 매개변수에 사용하는 어노테이션임, 아래의 코드와 같은 기능을 수행함
		// String userid = request.getParameter("userid");

		int idCount = employeeService.selectCheckId(userid);

		String returnStr = null;
		if (idCount == 0) {
			returnStr = "ok";
		} else {
			returnStr = "dup";
		}

		// response 를 이용해서 클라이언트와 출력스트림을 열어서 값 보냄
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
	}

	// 회원가입 요청 처리용 메소드
	@RequestMapping(value = "eenroll.do", method = RequestMethod.POST)
	public String employeeInsertMethod(Employee employee, Model model) {
		logger.info("enroll.do" + employee);

		// 패스워드 암호화 처리
		employee.setEmployeePwd(bcryptPasswordEncoder.encode(employee.getEmployeePwd()));
		logger.info("after encode : " + employee.getEmployeePwd());
		logger.info("length : " + employee.getEmployeePwd().length());

		if (employeeService.insertEmployee(employee) > 0) {
			return "common/main";
		} else {
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}
	}

	// My Page 클릭시 내 정보 보기 요청 처리용 메소드
	// 컨트롤러의 메소드 리턴 타입은 string,ModelAndView 를 사용할 수있음
	@RequestMapping("emyinfo.do")
	public String memberDetailMethod(@RequestParam("userId") String userId, Model model) {
		// 서비스 메소드로 아이디 전달하고, 해당 회원정보 받기
		// Employee employee = employeeService.selectEmployee();

		/*
		 * if (employee != null) { model.addAttribute("employee", employee); return
		 * "employee/myInfoPage"; } else { model.addAttribute("message", userId +
		 * " 회원 정보 실패!"); return "common/error"; }
		 */

		return "";
	}

	// 회원 정보 수정 페이지 내보내기용 메소드
	// 반환타입이 ModelAndView 인 경우
	@RequestMapping("emoveup.do")
	public ModelAndView moveUpdatePage(@RequestParam("userId") String userId, ModelAndView mv) {
		/*
		 * Employee employee = employeeService.selectEmployee(userId);
		 * 
		 * if (employee != null) { mv.addObject("employee", employee);
		 * mv.setViewName("employee/employeeUpdatePage"); } else {
		 * mv.addObject("message", "수정페이지로 이동 실패!"); mv.setViewName("common/error"); }
		 * 
		 * return mv;
		 */
		return mv;
	}

	// 회원 정보 수정 처리용 메소드 : 수정 성공시 myInfoPage.jsp 로 이동함
	// 패스워드 수정이 있는 경우
	@RequestMapping(value = "emupdate.do", method = RequestMethod.POST)
	public String employeeUpdateMethod(Employee employee, Model model,
			@RequestParam("origin_userpwd") String origin_userpwd) {
		logger.info("mupdate.do : " + employee);

		String userPwd = employee.getEmployeePwd().trim();
		if (userPwd != null && userPwd.length() > 0) {
			// 암호화된 기존의 패스워드와 새로운 패스워드를 비교해서 다른값이면
			if (!this.bcryptPasswordEncoder.matches(userPwd, origin_userpwd)) {
				// member 에 새로운 패스워드를 암호회해서 기록함
				employee.setEmployeePwd(this.bcryptPasswordEncoder.encode(userPwd));
			} else {
				employee.setEmployeePwd(origin_userpwd);
			}
		}

		if (employeeService.updateEmployee2(employee) > 0) {
			// 수정이 성공했다면, 컨트롤러의 다른 메소드를 직접 호출할 수있음
			// 필요시 값을 전달할 수도 있음 : 쿼리 스트링 사용함
			return "redirect:myinfo.do?userId=" + employee.getEmployeeId();
		} else {
			model.addAttribute("message", employee.getEmployeeId() + " 회원 정보 수정 실패!");
			return "common/error";
		}
	}

	// 회원탈퇴(삭제) 요청 처리용
	@RequestMapping("emdel.do")
	public String employeeDeleteMethod(@RequestParam("userId") String userId, Model model) {
		if (employeeService.deleteEmployee(userId) > 0) {
			// 회원 탈퇴성공시, 자동 로그아웃 처리해야함
			// 컨트롤러 메소드 안에서 다른 콘트롤러 메소드를 호출할 수 있음
			return "redirect:logout.do";
		} else {
			model.addAttribute("message", userId + " 회원 삭제 실패!");
			return "common/error";
		}
	}

	// 반환형이 ModelAndView, 페이징 처리 추가한 메소드
	@RequestMapping("emlist.do")
	public ModelAndView employeeListViewMethod(@RequestParam(name = "page", required = false) String page,
			ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한페이지에 목록10개씩 출력되게 한다면
		int limit = 10;
		// 회원 목록 전체 갯수 조회해 옴
		int listCount = employeeService.selectListCount();
		Paging paging = new Paging(listCount, currentPage, limit, "mlist.do");
		paging.calculator(); // 페이징에 필요한 항목들 계산 처리

		ArrayList<Employee> list = employeeService.selectList(paging);
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.setViewName("employee/employeeListView");
		} else {
			mv.addObject("message", currentPage + "페이지 : 회원 목록 조회 실패.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	// 관리지용 : 회원 로그인 제한/가능 처리용 메소드
	@RequestMapping("eloginok.do")
	public String employeeLoginOKMethod(Employee employee, Model model) {
		if (employeeService.updateLoginOK(employee) > 0) {
			return "redirect:mlist.do";
		} else {
			model.addAttribute("message", "로그인 제한/허용 처리 오류 발생!");
			return "common/error";
		}
	}

	// 관리자용 : 회원 검색 처리용 메소드
	@RequestMapping(value = "emsearch.do", method = RequestMethod.POST)
	public ModelAndView employeeSearchMethod(HttpServletRequest request, ModelAndView mv) {
		// 전송온 값 꺼내기
		String action = request.getParameter("action");
		// 필요한 변수 선언
		String keyword = null, begin = null, end = null;

		if (action.equals("enrolldate")) {
			begin = request.getParameter("begin");
			end = request.getParameter("end");
		} else {
			keyword = request.getParameter("keyword");
		}

		// 검색결과에 대한 페이징 처리
		// 출력할 페이지 지정
		int currentPage = 1;
		// 전송온 페이지 값이 있다면 추출함
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		// 한페이지당 출력할 목록 갯수 지정
		int limit = 10;
		// 전송온 limit 값이 있다면
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}

		// 총페이지 수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
		int listCount = 0;
		switch (action) {
		case "id":
			listCount = employeeService.selectSearchIDCount(keyword);
			break;
		case "gender":
			listCount = employeeService.selectSearchGenderCount(keyword);
			break;
		case "age":
			listCount = employeeService.selectSearchAgeCount(Integer.parseInt(keyword));
			break;
		case "enrolldate":
			listCount = employeeService.selectSearchDateCount(new SearchDate(Date.valueOf(begin), Date.valueOf(end)));
			break;
		case "loginok":
			listCount = employeeService.selectSearchLoginOKCount(keyword);
			break;
		}

		// 뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "msearch.do");
		paging.calculator();

		// service 메소드 호출하고 리턴결과 받기
		ArrayList<Employee> list = null;

		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());

		switch (action) {
		case "id":
			search.setKeyword(keyword);
			list = employeeService.selectSearchUserid(search);
			break;
		case "gender":
			search.setKeyword(keyword);
			list = employeeService.selectSearchGender(search);
			break;
		case "enrolldate":
			search.setBegin(Date.valueOf(begin));
			search.setEnd(Date.valueOf(end));
			list = employeeService.selectSearchEnrollDate(search);
			break;
		case "loginok":
			search.setKeyword(keyword);
			list = employeeService.selectSearchLoginOK(search);
			break;
		}

		// 받은 결과에 따라 성공/실패 페이지 내보내기
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);

			if (keyword != null) {
				mv.addObject("keyword", keyword);
			} else {
				mv.addObject("begin", begin);
				mv.addObject("end", end);
			}

			mv.setViewName("employee/employeeListView");
		} else {
			if (keyword != null) {
				mv.addObject("message", action + "에 대한 " + keyword + " 검색 결과가 존재하지 않습니다.");
			} else {
				mv.addObject("message", action + "에 대한 " + begin + " 부터 " + end + " 기간 사이에 가입한 회원 정보가 존재하지 않습니다.");
			}
			mv.setViewName("common/error");
		}

		return mv;
	}
	
	@RequestMapping("elist.do")
	public ModelAndView userListViewMethod(@RequestParam(name = "page", required = false) String page,
			ModelAndView mv) {

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지에 목록 10개씩 출력되게 한다면
		int limit = 10;
		// 회원 목록 전체 갯수 조회해 옴
		int listCount = employeeService.selectListCount();
		Paging paging = new Paging(listCount, currentPage, limit, "elist.do");
		paging.calculator();
		// 페이징에 필요한 항목들 계산 처리

		ArrayList<Employee> list = employeeService.selectList(paging);
		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.setViewName("employee/employeeList");
		} else {
			mv.addObject("message", "회원 정보가 존재하지 않습니다.");
			mv.setViewName("common/error");
		}
		return mv;
	}
}
