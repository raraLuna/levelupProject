package com.gs.levelup.character.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.character.model.dao.CharacterDao;
import com.gs.levelup.character.model.vo.Character;

@Service("characterService")
public class CharacterServiceImpl implements CharacterService{
	
	@Autowired
	private CharacterDao characterDao;

	@Override
	public ArrayList<com.gs.levelup.character.model.vo.Character> selectCharacters(int accountId) {
		return characterDao.selectCharacters(accountId);
	}

	@Override
	public com.gs.levelup.character.model.vo.Character selectCharacter(int charId) {
		return characterDao.selectCharacter(charId);
	}

	@Override
	public ArrayList<com.gs.levelup.character.model.vo.Character> selectAll() {
		return characterDao.selectAll();
	}

	@Override
	public Character selectCharacterName(String receiverName) {
		return characterDao.selectCharacterName(receiverName);
	}

}
