package com.gs.levelup.rodexMail.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.common.Paging;
import com.gs.levelup.rodexMail.model.vo.RodexMail;

@Repository("rodexMailDao")
public class RodexMailDao {
	@Autowired
	private org.mybatis.spring.SqlSessionTemplate sqlSessionTemplateMaria;

	public int insertRodexMail(Map purchase) {
		return sqlSessionTemplateMaria.insert("rodexMailMapper.insertRodexMail",purchase);
	}

	public int selectDetailRodexMail(int mailId) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<RodexMail> selectList(int accountId, int charId, Paging paging) {
		// TODO Auto-generated method stub
		return null;
	}

	public int deleteRodexMail(int mailId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
