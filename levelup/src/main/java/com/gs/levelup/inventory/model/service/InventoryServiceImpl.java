package com.gs.levelup.inventory.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup._case.model.vo.Case;
import com.gs.levelup.inventory.model.dao.InventoryDao;
import com.gs.levelup.inventory.model.vo.Inventory;
import com.gs.levelup.item.model.vo.Item;

@Service("inventoryService")
public class InventoryServiceImpl implements InventoryService{
	@Autowired
	private InventoryDao inventoryDao;

	@Override
	public ArrayList<Inventory> selectInventory(int charId) {
		return inventoryDao.selectInventory(charId);
	}

	@Override
	public ArrayList<Inventory> selectUserInventory(int charId) {
		return inventoryDao.selectUserInventory(charId);
	}

	@Override
	public ArrayList<Inventory> selectAll() {
		return inventoryDao.selectAll();
	}
	
	
	@Override
	public Inventory selectCharInventory(int charId) {
		return inventoryDao.selectCharInventory(charId);
	}
	
	@Override
	public int updateItemChange(Case _case) {
		return inventoryDao.updateItemChange(_case);
	}
	
	@Override
	public int deleteItemOne(Case _case) {
		return inventoryDao.deleteItemOne(_case);
	}
	
	@Override
	public Inventory selectPaymentItem(long uniqueId) {
		return inventoryDao.selectPaymentItem(uniqueId);
	}
	
	

}
