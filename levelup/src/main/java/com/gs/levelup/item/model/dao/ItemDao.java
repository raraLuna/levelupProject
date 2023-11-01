package com.gs.levelup.item.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup._case.model.vo.Case;
import com.gs.levelup.item.model.vo.Item;

@Repository("itemDao")
public class ItemDao {
	
	@Autowired	//root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Item> selectListItems() {
		// TODO Auto-generated method stub
		return null;
	}

	public Item selectItem(int itemId) {
		return sqlSessionTemplate.selectOne("itemMapper.selectItem", itemId);
	}

	public ArrayList<Item> selectListItemType(String itemType) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Item> selectSearchItems(String searchword) {
		// TODO Auto-generated method stub
		return null;
	}

	public Item selectOneItem(String itemName) {
		return sqlSessionTemplate.selectOne("itemMapper.selectOneItem", itemName);
	}

	public ArrayList<Item> selectItem3() {
		List<Item> list = sqlSessionTemplate.selectList("itemMapper.selectItem3");
		return (ArrayList<Item>)list;
	}

}
