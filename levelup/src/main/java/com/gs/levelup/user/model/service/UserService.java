package com.gs.levelup.user.model.service;

import java.util.ArrayList;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.user.model.vo.User;

public interface UserService {

	public User selectLogin(User user);
	public User selectUser(String userid);
	
	
	public ArrayList<User> selectList(Paging paging); // 페이징 처리된 목록 조회
	public int selectListCount(); 
	public int selectSearchIdCount(String keyword);

	// 검색 관련
	public int selectCheckId(String userid);
	// 유저 리스트 반환
	public ArrayList<User> selectSearchUserId(Search search);
	
	
	// 유저 객체 리턴
	public User selectOneSearchAccountId(Search search);
	public User selectOneSearchUserId(Search search);
	public User selectOneSearchEmail(Search search);
	
	
	public int insertUser(User user);
	public int updatePwd(User user);
	public String selectUserEmail(String email);

}
