package com.gs.levelup.charlog.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.charlog.model.vo.CharLog;

@Repository("charLogDao")
public class CharLogDao {

	@Autowired
	private org.mybatis.spring.SqlSessionTemplate sqlSessionTemplateMaria;

	public ArrayList<CharLog> selectCharLog(int charId) {
		List<CharLog> list = sqlSessionTemplateMaria.selectList("logMapper.selectCharLog",charId);
		return (ArrayList<CharLog>)list;
	}

}
