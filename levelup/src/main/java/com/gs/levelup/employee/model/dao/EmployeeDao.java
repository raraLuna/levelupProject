package com.gs.levelup.employee.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.employee.model.vo.Employee;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("employeeDao")
public class EmployeeDao {
	
	@Autowired	//root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;
	
	public Employee selectLogin(Employee member) {
		return sqlSessionTemplate.selectOne("employeeMapper.selectLogin", member);
	}

	public int insertMember(Employee member) {
		return sqlSessionTemplate.insert("employeeMapper.insertMember", member);
	}

	public Employee selectEmployee(String employeeEmail) {
		return sqlSessionTemplate.selectOne("employeeMapper.selectEmployee", employeeEmail);
	}

	public int updateMember(Employee member) {
		return sqlSessionTemplate.update("employeeMapper.updateMember", member);
	}
	
	public int updateMember2(Employee member) {
		return sqlSessionTemplate.update("employeeMapper.updateMember2", member);
	}

	public int deleteMember(String userid) {
		return sqlSessionTemplate.delete("employeeMapper.deleteMember", userid);
	}

	public ArrayList<Employee> selectList() {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.selectList");
		return (ArrayList<Employee>)list;
	}
	
	//페이징 처리 추가된 회원 목록 조회
	public ArrayList<Employee> selectList(Paging paging) {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.selectListP", paging);
		return (ArrayList<Employee>)list;
	}
	
	//회원 전체 목록 갯수 (관리자 제외)
	public int selectListCount() {
		return sqlSessionTemplate.selectOne("employeeMapper.selectListCount");
	}

	public int updateLoginOK(Employee member) {
		return sqlSessionTemplate.update("employeeMapper.updateLoginOK", member);
	}

	public ArrayList<Employee> selectSearchUserid(Search search) {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.selectSearchUserid", search);
		return (ArrayList<Employee>)list;
	}

	public ArrayList<Employee> selectSearchGender(Search search) {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.selectSearchGender", search);
		return (ArrayList<Employee>)list;
	}

	public ArrayList<Employee> selectSearchAge(Search search) {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.selectSearchAge", search);
		return (ArrayList<Employee>)list;
	}

	public ArrayList<Employee> selectSearchEnrollDate(Search search) {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.selectSearchEnrollDate", search);
		return (ArrayList<Employee>)list;
	}

	public ArrayList<Employee> selectSearchLoginOK(Search search) {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.selectSearchLoginOK", search);
		return (ArrayList<Employee>)list;
	}

	public int selectCheckId(String userid) {
		return sqlSessionTemplate.selectOne("employeeMapper.selectCheckId", userid);
	}
	
	//검색 목록 카운트 관련 
	
	public int selectSearchIDCount(String keyword) {
		return sqlSessionTemplate.selectOne("employeeMapper.selectSearchIDCount", keyword);
	}
	
	public int selectSearchGenderCount(String keyword) {
		return sqlSessionTemplate.selectOne("employeeMapper.selectSearchGenderCount", keyword);
	}
	
	public int selectSearchAgeCount(int age){
		return sqlSessionTemplate.selectOne("employeeMapper.selectSearchAgeCount", age);
	}
	
	public int selectSearchDateCount(SearchDate searchDate) {
		return sqlSessionTemplate.selectOne("employeeMapper.selectSearchDateCount", searchDate);
	}
	
	public int selectSearchLoginOKCount(String keyword){
		return sqlSessionTemplate.selectOne("employeeMapper.selectSearchLoginOKCount", keyword);
	}

	public Employee selectManager(String managerId) {
		return sqlSessionTemplate.selectOne("employeeMapper.selectManager", managerId);
	}
	
	
}
