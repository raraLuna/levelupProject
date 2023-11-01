package com.gs.levelup.inquiry.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.inquiry.model.dao.InquiryDao;
import com.gs.levelup.inquiry.model.vo.Inquiry;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryDao inquiryDao;

	@Override
	public ArrayList<Inquiry> selectList(Paging paging) {
		return inquiryDao.selectList(paging);
	}

	@Override
	public ArrayList<Inquiry> selectListType(Search search) {
		return inquiryDao.selectListType(search);
	}

	@Override
	public int selectListCount() {
		return inquiryDao.selectListCount();
	}

	@Override
	public int selectListCount(String type) {
		return inquiryDao.selectListCount(type);
	}

	@Override
	public int insertInquiryAnswer(Inquiry inquiry) {
		return inquiryDao.insertInquiryAnswer(inquiry);
	}

	@Override
	public int deleteInquiryAnswer(String inquiryId) {
		return inquiryDao.deleteInquiryAnswer(inquiryId);
	}

	@Override
	public int selectSearchUserIDCount(String keyword) {
		return inquiryDao.selectSearchUserIDCount(keyword);
	}

	@Override
	public int selectSearchTitleCount(String keyword) {
		return inquiryDao.selectSearchTitleCount(keyword);
	}

	@Override
	public int selectSearchTypeCount(String type) {
		return inquiryDao.selectSearchTypeCount(type);
	}

	@Override
	public int selectSearchDateCount(Search search) {
		return inquiryDao.selectSearchDateCount(search);
	}

	@Override
	public ArrayList<Inquiry> selectSearchUserID(Search search) {
		return inquiryDao.selectSearchUserID(search);
	}

	@Override
	public ArrayList<Inquiry> selectSearchType(Search search) {
		return inquiryDao.selectSearchType(search);
	}

	@Override
	public ArrayList<Inquiry> selectSearchDate(Search search) {
		return inquiryDao.selectSearchDate(search);
	}

	@Override
	public Inquiry selectInquiry(String inquiryId) {
		return inquiryDao.selectInquiry(inquiryId);
	}

	@Override
	public ArrayList<Inquiry> selectSearchTitle(Search search) {
		return inquiryDao.selectSearchTitle(search);
	}

	@Override
	public int insertInquiry(Inquiry inquiry) {
		return inquiryDao.insertInqury(inquiry);
	}

	@Override
	public ArrayList<Inquiry> selectUserPreviousInquiry(String userId) {
		return inquiryDao.selectUserPreviousInquiry(userId);
	}

	@Override
	public int updateInquiryAnswer(Inquiry inquiry) {
		return inquiryDao.updateInquiryAnswer(inquiry);
	}

	@Override
	public int deleteInquiry(String inquiryId) {
		return inquiryDao.deleteInquiry(inquiryId);
	}

	@Override
	public int updateInquiry(Inquiry inquiry) {
		return inquiryDao.updateInquiry(inquiry);
	}

}
