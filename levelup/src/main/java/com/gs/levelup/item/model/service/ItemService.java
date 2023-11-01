package com.gs.levelup.item.model.service;

import java.util.ArrayList;

import com.gs.levelup._case.model.vo.Case;
import com.gs.levelup.item.model.vo.Item;

public interface ItemService {
	public ArrayList<Item> selectListItems();
	public Item selectItem(int itemId);
	public ArrayList<Item> selectListItemType(String itemType);
	public ArrayList<Item> selectSearchItems(String searchword);
	public Item selectOneItem(String itemName);
	public ArrayList<Item> selectItem3();
}
