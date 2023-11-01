package com.gs.levelup.email_check.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.email_check.model.vo.EmailCheck;
import com.gs.levelup.employee.model.vo.Employee;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("emailCheckDao")
public class EmailCheckDao {
	
	@Autowired	//root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertEmailCheck(EmailCheck emailCheck) {
		return sqlSessionTemplate.insert("emailcheckMapper.insertEmailCheck", emailCheck);
	}

	public int selectCheckCode(EmailCheck emailCheck) {
		return sqlSessionTemplate.selectOne("emailcheckMapper.selectCheckCode", emailCheck);
	}
	
}
