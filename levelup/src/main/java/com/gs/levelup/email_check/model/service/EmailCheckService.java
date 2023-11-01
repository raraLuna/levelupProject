package com.gs.levelup.email_check.model.service;

import java.util.ArrayList;
import com.gs.levelup.common.Paging;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.email_check.model.vo.EmailCheck;
import com.gs.levelup.common.Search;
import com.gs.levelup.employee.model.vo.Employee;

public interface EmailCheckService {

	int insertEmailCheck(EmailCheck emailCheck);

	int selectCheckCode(EmailCheck emailCheck);
	
	
}
