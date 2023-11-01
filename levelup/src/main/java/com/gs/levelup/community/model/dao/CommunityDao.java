package com.gs.levelup.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.community.model.vo.Community;

@Repository("communityDao")
public class CommunityDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ArrayList<Community> selectCommunityTop() {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("comMapper.selectListCount");
	}

	public ArrayList<Community> selectList(Paging paging) {
		List<Community> list = sqlSessionTemplate.selectList("comMapper.selectList",paging);
		return (ArrayList<Community>)list;
	}
	public ArrayList<HashMap> selectListHashMap(Paging paging) {
		List<HashMap> list = sqlSessionTemplate.selectList("comMapper.selectListHashMap",paging);
		return (ArrayList<HashMap>)list;
	}

	public int insertCommunity(Community community) {
		return sqlSessionTemplate.insert("comMapper.insertCommunity",community);
	}

	public Community selectCommunity(String board_id) {
		return sqlSessionTemplate.selectOne("comMapper.selectCommunity", board_id);
	}

	public int updateReadCount(String board_id) {
		return sqlSessionTemplate.update("comMapper.updateReadCount", board_id);
	}

	public int updateCommunity(Community community) {
		return sqlSessionTemplate.update("comMapper.updateCommunity", community);
	}

	public int selectSearchTitleCount(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Community> selectSearchTitle(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectSearchContentCount(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Community> selectSearchContent(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectSearchDateCount(SearchDate searchDate) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Community> selectSearchDate(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteCommunity(String board_id) {
		return sqlSessionTemplate.update("comMapper.deleteCommunity", board_id);
	}

	public int insertCommunityRep(Community community) {
		return sqlSessionTemplate.insert("comMapper.insertCommunityRep", community);
	}

	public int updateCommunityRep(String board_id) {
		return sqlSessionTemplate.update("comMapper.updateCommunityRep", board_id);
	}

	public ArrayList selectReplys(String board_id) {
		List<Community> list = sqlSessionTemplate.selectList("comMapper.selectReplys",board_id);
		return (ArrayList<Community>)list;
	}

	public int updateRepReadCount(String board_id) {
		return sqlSessionTemplate.update("comMapper.updateRepReadCount",board_id);
	}

	public int updateAttach(Community community) {
		return sqlSessionTemplate.update("comMapper.updateAttach",community);
	}
    
  public ArrayList<Community> selectCommunities5(String keyword) {
		List<Community> list = sqlSessionTemplate.selectList("comMapper.selectCommunities5",keyword);
		return (ArrayList<Community>)list;
	}

public int selectSearchCount(String keyword) {
	return sqlSessionTemplate.selectOne("comMapper.selectSearchCount", keyword);
}

public ArrayList<Community> selectSearch(Search search) {
	List<Community> list = sqlSessionTemplate.selectList("comMapper.selectSearch",search);
	return (ArrayList<Community>)list;
}

}
