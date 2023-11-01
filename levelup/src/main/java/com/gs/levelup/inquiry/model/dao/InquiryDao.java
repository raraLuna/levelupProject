package com.gs.levelup.inquiry.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.inquiry.model.vo.Inquiry;

@Repository("inquiryDao")
public class InquiryDao {
	
	@Autowired  
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Inquiry> selectList(Paging paging) {
		List<Inquiry> list = sqlSessionTemplate.selectList("inquiryMapper.selectList", paging);
		return (ArrayList<Inquiry>) list;
	}
	
	public ArrayList<Inquiry> selectListType(Search search) {
		List<Inquiry> list = sqlSessionTemplate.selectList("inquiryMapper.selectListType", search);
		return (ArrayList<Inquiry>) list;
	}

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("inquiryMapper.selectListCount");
	}
	
	public int selectListCount(String type1) {
		int type = Integer.parseInt(type1);
		return sqlSessionTemplate.selectOne("inquiryMapper.selectListCountType", type);
	}
	
	public int insertInquiryAnswer(Inquiry inquiry) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateInquiryAnswer(Inquiry inquiry) {	
		return sqlSessionTemplate.update("inquiryMapper.updateInquiryAnswer", inquiry);
	}

	public int deleteInquiryAnswer(String inquiryId) {
		// TODO Auto-generated method stub
		return 0;
	}


	public int selectSearchUserIDCount(String keyword) {
		return sqlSessionTemplate.selectOne("inquiryMapper.selectSearchUserIDCount", keyword);
	}
	
	public int selectSearchTitleCount(String keyword) {
		return sqlSessionTemplate.selectOne("inquiryMapper.selectSearchTitleCount", keyword);
	}

	public int selectSearchTypeCount(String type) {
		return sqlSessionTemplate.selectOne("inquiryMapper.selectSearchTypeCount", type);
	}

	public int selectSearchDateCount(Search search) {
		return sqlSessionTemplate.selectOne("inquiryMapper.selectSearchDateCount", search);
	}

	public ArrayList<Inquiry> selectSearchUserID(Search search) {
		List<Inquiry> list = sqlSessionTemplate.selectList("inquiryMapper.selectSearchUserID", search);
		return (ArrayList<Inquiry>) list;
	}

	public ArrayList<Inquiry> selectSearchType(Search search) {
		List<Inquiry> list = sqlSessionTemplate.selectList("inquiryMapper.selectSearchType", search);
		return (ArrayList<Inquiry>) list;
	}

	public ArrayList<Inquiry> selectSearchDate(Search search) {
		List<Inquiry> list = sqlSessionTemplate.selectList("inquiryMapper.selectSearchDate", search);
		return (ArrayList<Inquiry>) list;
	}

	public int insertInqury(Inquiry inquiry) {
		return sqlSessionTemplate.insert("inquiryMapper.insertInquiry", inquiry);
	}

	public Inquiry selectInquiry(String inquiryId) {
		return sqlSessionTemplate.selectOne("inquiryMapper.selectInquiry", inquiryId);
	}
	
	public ArrayList<Inquiry> selectSearchTitle(Search search) {
		List<Inquiry> list = sqlSessionTemplate.selectList("inquiryMapper.selectSearchTitle", search);
		return (ArrayList<Inquiry>) list;
	}

	public ArrayList<Inquiry> selectUserPreviousInquiry(String userId) {
		List<Inquiry> list = sqlSessionTemplate.selectList("inquiryMapper.selectUserPreviousInquiry", userId);
		return (ArrayList<Inquiry>) list;
	}

	public int deleteInquiry(String inquiryId) {
		return sqlSessionTemplate.delete("inquiryMapper.deleteInquiry", inquiryId);
	}

	public int updateInquiry(Inquiry inquiry) {
		return sqlSessionTemplate.update("inquiryMapper.updateInquiry", inquiry);
	}
}
