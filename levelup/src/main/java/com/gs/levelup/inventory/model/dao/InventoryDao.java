package com.gs.levelup.inventory.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup._case.model.vo.Case;
import com.gs.levelup.charlog.model.vo.CharLog;
import com.gs.levelup.inventory.model.vo.Inventory;
import com.gs.levelup.item.model.vo.Item;

@Repository("inventoryDao")
public class InventoryDao {
	@Autowired
	private org.mybatis.spring.SqlSessionTemplate sqlSessionTemplateMaria;

	public ArrayList<Inventory> selectInventory(int charId) {
		List<Inventory> list = sqlSessionTemplateMaria.selectList("logMapper.selectInventory",charId);
		return (ArrayList<Inventory>)list;
	}

	public ArrayList<Inventory> selectUserInventory(int charId) {
		List<Inventory> list = sqlSessionTemplateMaria.selectList("inventoryMapper.selectUserInventory",charId);
		return (ArrayList<Inventory>)list;
	}

	public ArrayList<Inventory> selectAll() {
		List<Inventory> list = sqlSessionTemplateMaria.selectList("inventoryMapper.selectAll");
		return (ArrayList<Inventory>)list;
	}

		public Inventory selectCharInventory(int charId) {
		return sqlSessionTemplateMaria.selectOne("inventoryMapper.selectCharInventory", charId);
	}

		public int updateItemChange(Case _case) {
			return sqlSessionTemplateMaria.update("inventoryMapper.updateItemChange", _case);
		}

		public int deleteItemOne(Case _case) {
			return sqlSessionTemplateMaria.delete("inventoryMapper.deleteItemOne", _case);
		}

		public Inventory selectPaymentItem(long uniqueId) {
			return sqlSessionTemplateMaria.selectOne("inventoryMapper.selectPaymentItem", uniqueId);
		}


}
