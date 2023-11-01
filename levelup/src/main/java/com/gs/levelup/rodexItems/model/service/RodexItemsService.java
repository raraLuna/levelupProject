package com.gs.levelup.rodexItems.model.service;

import com.gs.levelup.item.model.vo.Item;
import com.gs.levelup.rodexItems.model.vo.RodexItems;
import com.gs.levelup.rodexMail.model.vo.RodexMail;

public interface RodexItemsService {
	public int insertRodexItems(RodexMail rodexMail, Item item);
	public int deleteRodexItems(RodexMail rodexMail, Item item);
	public int selectRodexMailId(long uniqueId);
	public RodexItems selectRodexItem(long uniqueId);
	public int deleteRodexItemOne(int mailId);
	public int deleteRodexEmailOne(int mailId);
}
