package com.gs.levelup.inquiry.model.service;

import java.util.ArrayList;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.inquiry.model.vo.Inquiry;

public interface InquiryService {

	public ArrayList<Inquiry> selectList(Paging paging);	
	public ArrayList<Inquiry> selectListType(Search search);	
	public int insertInquiryAnswer(Inquiry inquiry);	
	public int updateInquiryAnswer(Inquiry inquiry);	
	public int updateInquiry(Inquiry inquiry);	
	public int deleteInquiryAnswer(String inquiryId);	
	public int selectListCount();
	public int selectListCount(String type);
	public int selectSearchUserIDCount(String keyword);
	public int selectSearchTitleCount(String keyword);
	public int selectSearchTypeCount(String type);
	public int selectSearchDateCount(Search search);
	public ArrayList<Inquiry> selectSearchUserID(Search search);
	public ArrayList<Inquiry> selectSearchType(Search search);
	public ArrayList<Inquiry> selectSearchDate(Search search);
	public ArrayList<Inquiry> selectSearchTitle(Search search);
	public int insertInquiry(Inquiry inquiry);
	public Inquiry selectInquiry(String inquiryId);
	public ArrayList<Inquiry> selectUserPreviousInquiry(String userId);
	public int deleteInquiry(String inquiryId);
}
