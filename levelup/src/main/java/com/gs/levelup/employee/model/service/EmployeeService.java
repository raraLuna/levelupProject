package com.gs.levelup.employee.model.service;

import java.util.ArrayList;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.common.Search;
import com.gs.levelup.employee.model.vo.Employee;

public interface EmployeeService {
	public Employee selectLogin(Employee employee);
	public int insertEmployee(Employee employee);
	public Employee selectEmployee(String employeeEmail);
	public int updateEmployee(Employee employee);
	public int updateEmployee2(Employee employee);
	public int deleteEmployee(String userid);
	public ArrayList<Employee> selectList(); //페이징 처리없는 전체 목록조회
	public ArrayList<Employee> selectList(Paging paging); //페이징 처리된 목록 조회
	public int selectListCount();
	public int updateLoginOK(Employee employee);
	//검색 목록 카운트 관련 
	public int selectSearchIDCount(String keyword);
	public int selectSearchGenderCount(String keyword);
	public int selectSearchAgeCount(int age);
	public int selectSearchDateCount(SearchDate searchDate);
	public int selectSearchLoginOKCount(String keyword);
	//검색 관련
	public ArrayList<Employee> selectSearchUserid(Search Search);
	public ArrayList<Employee> selectSearchGender(Search Search);
	public ArrayList<Employee> selectSearchAge(Search Search);
	public ArrayList<Employee> selectSearchEnrollDate(Search Search);
	public ArrayList<Employee> selectSearchLoginOK(Search Search);
	public int selectCheckId(String userid);
	public Employee selectManager(String managerId);
}
