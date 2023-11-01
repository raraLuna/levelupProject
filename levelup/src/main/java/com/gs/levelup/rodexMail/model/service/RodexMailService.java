package com.gs.levelup.rodexMail.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.gs.levelup.common.Paging;
import com.gs.levelup.rodexMail.model.vo.RodexMail;

public interface RodexMailService {
	public int insertRodexMail(Map purchase);
	public int selectDetailRodexMail(int mailId);
	public ArrayList<RodexMail> selectList(int accountId, int charId, Paging paging);
	public int deleteRodexMail(int mailId);
}
