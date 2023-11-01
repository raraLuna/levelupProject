package com.gs.levelup.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired	//root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	
	//공지사항 페이지 단위로 목록 조회 : 공지사항 목록보기용
	public ArrayList<Notice> selectList(Paging paging){
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectList", paging);
		return (ArrayList<Notice>)list;
	}
	//공지사항 페이지 단위로 목록 조회 : 공지사항 목록보기용
	public ArrayList<Notice> selectTList(Paging paging, String teamId, String departmentId){
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("paging", paging);
	    parameters.put("teamId", teamId);
	    parameters.put("departmentId", departmentId);
	    
	    List<Notice> tlist = sqlSessionTemplate.selectList("noticeMapper.selectTList", parameters);
	    return (ArrayList<Notice>)tlist;
	}
	//공지사항 페이지 단위로 목록 조회 : 공지사항 목록보기용
	public ArrayList<Notice> selectDList(Paging paging, String departmentId){
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("paging", paging);
	    parameters.put("departmentId", departmentId);
	    
		List<Notice> dlist = sqlSessionTemplate.selectList("noticeMapper.selectDList", parameters);
		return (ArrayList<Notice>)dlist;
	}
	
	//공지글번호로 한 개 조회 : 공지사항 상세보기용
	public Notice selectOne(String noticeId) {
		return sqlSessionTemplate.selectOne("noticeMapper.selectOne", noticeId);
	}
	
	//새 공지글 등록
	public int insertNotice(Notice notice) {
		logger.info("noticeDao : " + notice);
		return sqlSessionTemplate.insert("noticeMapper.insertNotice", notice);
		
	}
	
	//공지글 수정
	public int updateNotice(Notice notice) {
		logger.info("noticeDao : " + notice);
		return sqlSessionTemplate.update("noticeMapper.updateNotice", notice);
	}
	
	//공지글 삭제
	public int deleteNotice(String noticeId) {
		return sqlSessionTemplate.delete("noticeMapper.deleteNotice", noticeId);
	}
	
	public int selectListCount() {
		return sqlSessionTemplate.selectOne("noticeMapper.getListCount");
	}
	
	public int selectTListCount(String teamId, String departmentId) {
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("teamId", teamId);
	    parameters.put("departmentId", departmentId);
		return sqlSessionTemplate.selectOne("noticeMapper.getTListCount", parameters);
	}
	public int selectDListCount(String departmentId) {
		return sqlSessionTemplate.selectOne("noticeMapper.getDListCount", departmentId);
	}

	public int selectSearchTitleCount(Search search) {
		return sqlSessionTemplate.selectOne("noticeMapper.getSearchTitleCount", search);
	}
	public int selectSearchTitleCountD(Search search) {
		return sqlSessionTemplate.selectOne("noticeMapper.getSearchTitleCountD", search);
	}

	public int selectSearchContentCount(String keyword) {
		return sqlSessionTemplate.selectOne("noticeMapper.getSearchContentCount", keyword);
	}

	public int selectSearchDateCount(SearchDate date) {
		return sqlSessionTemplate.selectOne("noticeMapper.getSearchDateCount", date);
	}

	public ArrayList<Notice> selectSearchTitle(Search search) {
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectSearchTitle", search);
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectSearchContent(Search search) {
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectSearchContent", search);
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectSearchDate(Search search) {
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectSearchDate", search);
		return (ArrayList<Notice>)list;
	}

	public int updateReadCount(String noticeId) {
		return sqlSessionTemplate.update("noticeMapper.addReadCount", noticeId);
	}
	public ArrayList<Notice> selectNotices5(String keyword) {
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectNotices5", keyword);
		return (ArrayList<Notice>)list;
	}
}








