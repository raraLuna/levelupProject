package com.gs.levelup.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.user.model.dao.UserDao;
import com.gs.levelup.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;
	
	public UserServiceImpl() {}

	@Override
	public User selectLogin(User user) {
		return userDao.selectLogin(user);
	}

	@Override
	public User selectUser(String userid) {
		return userDao.selectUser(userid);
	}

	@Override
	public ArrayList<User> selectList(Paging paging) {
		return userDao.selectList(paging);
	}

	@Override
	public int selectListCount() {
		return userDao.selectListCount();
	}

	@Override
	public int selectSearchIdCount(String keyword) {
		return userDao.selectSearchIdCount(keyword);
	}

	@Override
	public ArrayList<User> selectSearchUserId(Search search) {
		return userDao.selectSearchUserId(search);
	}

	@Override
	public User selectOneSearchAccountId(Search search) {
		return userDao.selectOneSearchAccountId(search);
	}

	@Override
	public User selectOneSearchUserId(Search search) {
		return userDao.selectOneSearchUserId(search);
	}

	@Override
	public User selectOneSearchEmail(Search search) {
		return userDao.selectOneSearchEmail(search);
	}

	@Override
	public int selectCheckId(String userid) {
		return userDao.selectCheckId(userid);
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public int updatePwd(User user) {
		return userDao.updatePwd(user);
	}

	@Override
	public String selectUserEmail(String email) {
		return userDao.selectUserEmail(email);
	}

}
