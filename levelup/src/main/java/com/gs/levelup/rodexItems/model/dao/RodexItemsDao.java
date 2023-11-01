package com.gs.levelup.rodexItems.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.item.model.vo.Item;
import com.gs.levelup.rodexItems.model.vo.RodexItems;
import com.gs.levelup.rodexMail.model.vo.RodexMail;

@Repository("rodexItemsDao")
public class RodexItemsDao {
	
	@Autowired
	private org.mybatis.spring.SqlSessionTemplate sqlSessionTemplateMaria;

	public int insertRodexItems(RodexMail rodexMail, Item item) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteRodexItems(RodexMail rodexMail, Item item) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int selectRodexMailId(long uniqueId) {
		return sqlSessionTemplateMaria.selectOne("rodexMailMapper.selectRodexMailId", uniqueId);
	}
	
	public RodexItems selectRodexItem(long uniqueId) {
		return sqlSessionTemplateMaria.selectOne("rodexMailMapper.selectRodexItem", uniqueId);
	}

	public int deleteRodexItemOne(int mailId) {
		return sqlSessionTemplateMaria.delete("rodexMailMapper.deleteRodexItemOne", mailId);
	}

	public int deleteRodexEmailOne(int mailId) {
		return sqlSessionTemplateMaria.delete("rodexMailMapper.deleteRodexEmailOne", mailId);
	}


}
