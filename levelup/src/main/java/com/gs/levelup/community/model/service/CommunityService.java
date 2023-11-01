package com.gs.levelup.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.community.model.vo.Community;

public interface CommunityService {

	public ArrayList<Community> selectCommunityTop();

	public int selectListCount();

	public ArrayList<Community> selectList(Paging paging);

	public int insertCommunity(Community community);

	public Community selectCommunity(String board_id);

	public int updateCommunity(Community community);

	public int selectSearchTitleCount(String keyword);

	public ArrayList<Community> selectSearchTitle(Search search);

	public int selectSearchContentCount(String keyword);

	public ArrayList<Community> selectSearchContent(Search search);

	public int selectSearchDateCount(SearchDate searchDate);

	public ArrayList<Community> selectSearchDate(Search search);

	public int deleteCommunity(String board_id);

	ArrayList<HashMap> selectListHashMap(Paging paging);

	int updateReadCount(String board_id);

	public int insertCommunityRep(Community community);

	public int updateCommunityRep(String board_id);

	public ArrayList<Community> selectReplys(String board_id);

	public int updateRepReadCount(String board_id);

	public int updateAttach(Community community);

	public ArrayList<Community> selectCommunities5(String keyword);

	public int selectSearchCount(String keyword);

	public ArrayList<Community> selectSearch(Search search);

}
