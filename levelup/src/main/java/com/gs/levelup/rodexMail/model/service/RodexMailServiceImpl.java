package com.gs.levelup.rodexMail.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.common.Paging;
import com.gs.levelup.rodexMail.model.dao.RodexMailDao;
import com.gs.levelup.rodexMail.model.vo.RodexMail;

@Service("rodexMailService")
public class RodexMailServiceImpl implements RodexMailService{
	@Autowired
	private RodexMailDao rodexMailDao;

	@Override
	public int insertRodexMail(Map purchase) {
		return rodexMailDao.insertRodexMail(purchase);
	}

	@Override
	public int selectDetailRodexMail(int mailId) {
		return rodexMailDao.selectDetailRodexMail(mailId);
	}

	@Override
	public ArrayList<RodexMail> selectList(int accountId, int charId, Paging paging) {
		return rodexMailDao.selectList(accountId, charId,paging);
	}

	@Override
	public int deleteRodexMail(int mailId) {
		return rodexMailDao.deleteRodexMail(mailId);
	}
	
	

}
