package com.gs.levelup.item.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup._case.model.vo.Case;
import com.gs.levelup.item.model.dao.ItemDao;
import com.gs.levelup.item.model.vo.Item;

@Service("itemService")
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemDao itemDao;

	@Override
	public ArrayList<Item> selectListItems() {
		return itemDao.selectListItems();
	}

	@Override
	public Item selectItem(int itemId) {
		return itemDao.selectItem(itemId);
	}

	@Override
	public ArrayList<Item> selectListItemType(String itemType) {
		return itemDao.selectListItemType(itemType);
	}

	@Override
	public ArrayList<Item> selectSearchItems(String searchword) {
		return itemDao.selectSearchItems(searchword);
	}

	@Override
	public Item selectOneItem(String itemName) {
		return itemDao.selectOneItem(itemName);
	}

	@Override
	public ArrayList<Item> selectItem3() {
		return itemDao.selectItem3();
	}
		
}
