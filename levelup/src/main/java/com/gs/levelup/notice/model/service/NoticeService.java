package com.gs.levelup.notice.model.service;

import java.util.ArrayList;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.notice.model.vo.Notice;


public interface NoticeService {
	public ArrayList<Notice> selectList(Paging paging);
	public ArrayList<Notice> selectTList(Paging paging, String teamId, String departmentId);
	public ArrayList<Notice> selectDList(Paging paging, String departmentId);
	public Notice selectOne(String noticeId);
	public int insertNotice(Notice notice);
	public int updateNotice(Notice notice);
	public int deleteNotice(String noticeId);
	public int selectListCount();
	public int selectTListCount(String teamId, String departmentId);
	public int selectDListCount(String departmentId);
	public int selectSearchTitleCount(Search search);
	public int selectSearchTitleCountD(Search search);
	public int selectSearchContentCount(String keyword);
	public int selectSearchDateCount(SearchDate date);
	public ArrayList<Notice> selectSearchTitle(Search search);
	public ArrayList<Notice> selectSearchContent(Search search);
	public ArrayList<Notice> selectSearchDate(Search search);
	public void updateReadCount(String noticeId);
	public ArrayList<Notice> selectNotices5(String keyword);
 
}
