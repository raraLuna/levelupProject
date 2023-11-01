package com.gs.levelup.picklog.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.picklog.model.vo.PickLog;

@Repository("pickLogDao")
public class PickLogDao {
	@Autowired
	private org.mybatis.spring.SqlSessionTemplate sqlSessionTemplateMaria;

	public ArrayList<PickLog> selectPickLog(int charId) {
		List<PickLog> list = sqlSessionTemplateMaria.selectList("logMapper.selectPickLog",charId);
		return (ArrayList<PickLog>)list;
	}

	public int selectPayItemPickLog(long uniqueId) {
		return sqlSessionTemplateMaria.selectOne("logMapper.selectPayItemPickLog", uniqueId);
	}

	public ArrayList<PickLog> selectPayItemPickLogAll() {
		List<PickLog> list = sqlSessionTemplateMaria.selectList("logMapper.selectPayItemPickLogAll");
		return (ArrayList<PickLog>)list;
	}
}
