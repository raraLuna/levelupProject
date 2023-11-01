package com.gs.levelup.character.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.character.model.vo.Character;

@Repository("characterDao")
public class CharacterDao {

	@Autowired
	private org.mybatis.spring.SqlSessionTemplate sqlSessionTemplateMaria;

	public ArrayList<com.gs.levelup.character.model.vo.Character> selectCharacters(int accountId) {
		List<com.gs.levelup.character.model.vo.Character> list = sqlSessionTemplateMaria.selectList("charMapper.selectCharacters", accountId);
		return (ArrayList<com.gs.levelup.character.model.vo.Character>) list;
	}

	public com.gs.levelup.character.model.vo.Character selectCharacter(int charId) {
		return sqlSessionTemplateMaria.selectOne("charMapper.selectCharacter", charId);
	}

	public ArrayList<com.gs.levelup.character.model.vo.Character> selectAll() {
		List<com.gs.levelup.character.model.vo.Character> list = sqlSessionTemplateMaria.selectList("charMapper.selectAll");
		return (ArrayList<com.gs.levelup.character.model.vo.Character>)list;
	}

	public Character selectCharacterName(String receiverName) {
		return sqlSessionTemplateMaria.selectOne("charMapper.selectCharacterName", receiverName);
	}

}
