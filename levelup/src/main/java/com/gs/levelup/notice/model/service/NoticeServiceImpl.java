package com.gs.levelup.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.notice.model.dao.NoticeDao;
import com.gs.levelup.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	private static final String String = null;
	@Autowired	//자동 DI 처리됨 : 자동 객체 생성됨
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectList(Paging paging){
		return noticeDao.selectList(paging);
	}
	@Override
	public ArrayList<Notice> selectTList(Paging paging, String teamId, String departmentId){
		return noticeDao.selectTList(paging, teamId, departmentId);
	}
	@Override
	public ArrayList<Notice> selectDList(Paging paging, String departmentId){
		return noticeDao.selectDList(paging, departmentId);
	}
	@Override
	public Notice selectOne(String noticeId) {
		return noticeDao.selectOne(noticeId);
	}
	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}
	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}
	@Override
	public int deleteNotice(String noticeId) {
		return noticeDao.deleteNotice(noticeId);
	}
	@Override
	public int selectListCount() {
		return noticeDao.selectListCount();
	}
	@Override
	public int selectTListCount(String teamId, String departmentId) {
		return noticeDao.selectTListCount(teamId, departmentId);
	}
	@Override
	public int selectDListCount(String departmentId) {
		return noticeDao.selectDListCount(departmentId);
	}
	@Override
	public int selectSearchTitleCount(Search search) {
		return noticeDao.selectSearchTitleCount(search);
	}
	@Override
	public int selectSearchTitleCountD(Search search) {
		return noticeDao.selectSearchTitleCountD(search);
	}
	@Override
	public int selectSearchContentCount(String keyword) {
		return noticeDao.selectSearchContentCount(keyword);
	}
	@Override
	public int selectSearchDateCount(SearchDate date) {
		return noticeDao.selectSearchDateCount(date);
	}
	@Override
	public ArrayList<Notice> selectSearchTitle(Search search) {
		return noticeDao.selectSearchTitle(search);
	}
	@Override
	public ArrayList<Notice> selectSearchContent(Search search) {
		return noticeDao.selectSearchContent(search);
	}
	@Override
	public ArrayList<Notice> selectSearchDate(Search search) {
		return noticeDao.selectSearchDate(search);
	}
	@Override
	public void updateReadCount(String noticeId) {
		noticeDao.updateReadCount(noticeId);
	}
	@Override
	public ArrayList<Notice> selectNotices5(String keyword) {
		return noticeDao.selectNotices5(keyword);
	}
}
