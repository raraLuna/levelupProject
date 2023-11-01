package com.gs.levelup.python;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("pythonDao")
public class PythonDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int deleteAll() {
		return sqlSessionTemplate.update("pythonMapper.deleteAll");
	}

	public ArrayList<Python> selectAll() {
		List<Python> list = sqlSessionTemplate.selectList("pythonMapper.selectAll");
		return (ArrayList<Python>)list;
	}
	
	
}
