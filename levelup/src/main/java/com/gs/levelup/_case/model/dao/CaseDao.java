package com.gs.levelup._case.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup._case.model.vo.Case;
import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;

@Repository("caseDao")
public class CaseDao {
	@Autowired 
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private org.mybatis.spring.SqlSessionTemplate sqlSessionTemplateMaria;

	public int insertCase(Case _case) {
		return sqlSessionTemplate.insert("caseMapper.insertCase", _case);
	}

	public Case selectCase(String caseId) {
		return sqlSessionTemplate.selectOne("caseMapper.selectCase", caseId);
	}

	public int updateCase(Case _case) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public int updateCaseAprrove(Case _case) {
		return sqlSessionTemplate.update("caseMapper.updateCaseAprrove", _case);
	}
	
	public int updateCaseReject(String caseId) {
		return sqlSessionTemplate.update("caseMapper.updateCaseReject", caseId);
	}

	public ArrayList<Case> selectList(Paging paging) {
		List<Case> list = sqlSessionTemplate.selectList("caseMapper.selectList", paging);
		return (ArrayList<Case>) list;
	}
	
	public ArrayList<Case> selectMyCaseList(String myEmployeeId) {
		List<Case> list = sqlSessionTemplate.selectList("caseMapper.selectMyCaseList", myEmployeeId);
		return (ArrayList<Case>) list;
	}

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("caseMapper.selectListCount");
	}

	public int selectSearchWriterNameCount(String keyword) {
		return sqlSessionTemplate.selectOne("caseMapper.selectSearchWriterNameCount", keyword);
	}

	public int selectSearchTitleCount(String keyword) {
		return sqlSessionTemplate.selectOne("caseMapper.selectSearchTitleCount", keyword);
	}

	public int selectSearchDateCount(Search search) {
		return sqlSessionTemplate.selectOne("caseMapper.selectSearchDateCount", search);
	}

	public int selectSearchTypeCount(String keyword) {
		return sqlSessionTemplate.selectOne("caseMapper.selectSearchTypeCount", keyword);
	}

	public ArrayList<Case> selectSearchWriterName(Search search) {
		List<Case> list = sqlSessionTemplate.selectList("caseMapper.selectSearchWriterName", search);
		return (ArrayList<Case>) list;
	}

	public ArrayList<Case> selectSearchTitle(Search search) {
		List<Case> list = sqlSessionTemplate.selectList("caseMapper.selectSearchTitle", search);
		return (ArrayList<Case>) list;
	}

	public ArrayList<Case> selectSearchDate(Search search) {
		List<Case> list = sqlSessionTemplate.selectList("caseMapper.selectSearchDate", search);
		return (ArrayList<Case>) list;
	}

	public ArrayList<Case> selectSearchType(Search search) {
		List<Case> list = sqlSessionTemplate.selectList("caseMapper.selectSearchType", search);
		return (ArrayList<Case>) list;
	}
}
