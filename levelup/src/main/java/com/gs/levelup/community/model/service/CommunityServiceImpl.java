package com.gs.levelup.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.community.model.dao.CommunityDao;
import com.gs.levelup.community.model.vo.Community;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao communityDao;

	@Override
	public ArrayList<Community> selectCommunityTop() {
		return communityDao.selectCommunityTop();
	}

	@Override
	public int selectListCount() {
		return communityDao.selectListCount();
	}

	@Override
	public ArrayList<Community> selectList(Paging paging) {
		return communityDao.selectList(paging);
	}

	@Override
	public ArrayList<HashMap> selectListHashMap(Paging paging) {
		return communityDao.selectListHashMap(paging);
	}

	@Override
	public int insertCommunity(Community community) {
		return communityDao.insertCommunity(community);
	}

	@Override
	public Community selectCommunity(String board_id) {
		return communityDao.selectCommunity(board_id);
	}

	@Override
	public int updateReadCount(String board_id) {
		return communityDao.updateReadCount(board_id);
	}

	@Override
	public int updateCommunity(Community community) {
		return communityDao.updateCommunity(community);
	}

	@Override
	public int selectSearchTitleCount(String keyword) {
		return communityDao.selectSearchTitleCount(keyword);
	}

	@Override
	public ArrayList<Community> selectSearchTitle(Search search) {
		return communityDao.selectSearchTitle(search);
	}

	@Override
	public int selectSearchContentCount(String keyword) {
		return communityDao.selectSearchContentCount(keyword);
	}

	@Override
	public ArrayList<Community> selectSearchContent(Search search) {
		return communityDao.selectSearchContent(search);
	}

	@Override
	public int selectSearchDateCount(SearchDate searchDate) {
		return communityDao.selectSearchDateCount(searchDate);
	}

	@Override
	public ArrayList<Community> selectSearchDate(Search search) {
		return communityDao.selectSearchDate(search);
	}

	@Override
	public int deleteCommunity(String boardId) {
		return communityDao.deleteCommunity(boardId);
	}

	@Override
	public int insertCommunityRep(Community community) {
		return communityDao.insertCommunityRep(community);
	}

	@Override
	public int updateCommunityRep(String board_id) {
		return communityDao.updateCommunityRep(board_id);
	}

	@Override
	public ArrayList<Community> selectReplys(String board_id) {
		return communityDao.selectReplys(board_id);
	}

	@Override
	public int updateRepReadCount(String board_id) {
		return communityDao.updateRepReadCount(board_id);
	}

	@Override
	public int updateAttach(Community community) {
		return communityDao.updateAttach(community);
	}

	@Override
	public ArrayList<Community> selectCommunities5(String keyword) {
		return communityDao.selectCommunities5(keyword);
	}

	@Override
	public int selectSearchCount(String keyword) {
		return communityDao.selectSearchCount(keyword);
	}

	@Override
	public ArrayList<Community> selectSearch(Search search) {
		return communityDao.selectSearch(search);
	}

}
