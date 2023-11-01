package com.gs.levelup.rodexItems.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.item.model.vo.Item;
import com.gs.levelup.rodexItems.model.dao.RodexItemsDao;
import com.gs.levelup.rodexItems.model.vo.RodexItems;
import com.gs.levelup.rodexMail.model.vo.RodexMail;

@Service("rodexItemsService")
public class RodexItemsServiceImpl implements RodexItemsService{
	@Autowired
	private RodexItemsDao rodexItemsDao;
	
	@Override
	public int insertRodexItems(RodexMail rodexMail, Item item) {
		return rodexItemsDao.insertRodexItems(rodexMail, item);
	}

	@Override
	public int deleteRodexItems(RodexMail rodexMail, Item item) {
		return rodexItemsDao.deleteRodexItems(rodexMail, item);
	}
	
	@Override
	public int selectRodexMailId(long uniqueId) {
		return rodexItemsDao.selectRodexMailId(uniqueId);
	}
	
	@Override
	public RodexItems selectRodexItem(long uniqueId) {
		return rodexItemsDao.selectRodexItem(uniqueId);
	}
	
	@Override
	public int deleteRodexItemOne(int mailId) {
		return rodexItemsDao.deleteRodexItemOne(mailId);
	}
	
	@Override
	public int deleteRodexEmailOne(int mailId) {
		return rodexItemsDao.deleteRodexEmailOne(mailId);
	}

}
