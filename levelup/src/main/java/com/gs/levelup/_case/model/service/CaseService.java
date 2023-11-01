package com.gs.levelup._case.model.service;

import java.util.ArrayList;

import com.gs.levelup._case.model.vo.Case;
import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;

public interface CaseService {
	// CRUD
	public int insertCase(Case _case);
	public Case selectCase(String caseId);
	public int updateCase(Case _case);
	public int updateCaseAprrove(Case _case);
	public int updateCaseReject(String caseId);
	
	// 전체 목록 조회용
	public ArrayList<Case> selectList(Paging paging);  //페이징 처리된 목록 조회
	
	// My 기안 리스트 조회용
	public ArrayList<Case> selectMyCaseList(String myEmployeeId);
	
	//아이템변경기안 갯수
	public int selectListCount();
	
	//검색 목록 카운트 관련
	public int selectSearchWriterNameCount(String keyword);
	public int selectSearchTitleCount(String keyword);
	public int selectSearchDateCount(Search search);
	public int selectSearchTypeCount(String keyword);
	
	//검색 관련
	public ArrayList<Case> selectSearchWriterName(Search search);
	public ArrayList<Case> selectSearchTitle(Search search);
	public ArrayList<Case> selectSearchDate(Search search);
	public ArrayList<Case> selectSearchType(Search search);
}
