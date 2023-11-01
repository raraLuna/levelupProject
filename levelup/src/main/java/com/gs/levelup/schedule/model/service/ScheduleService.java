package com.gs.levelup.schedule.model.service;

import java.util.ArrayList;

import com.gs.levelup.common.Paging;
import com.gs.levelup.common.Search;
import com.gs.levelup.common.SearchDate;
import com.gs.levelup.schedule.model.vo.Schedule;

public interface ScheduleService {
	public ArrayList<Schedule> selectScheduleList(String employeeId, String teamId, String departmentId);
	public ArrayList<Schedule> selectTDScheduleList(String employeeId, String teamId, String departmentId);
	public int insertSchedule(Schedule schedule);
	public int updateSchedule(Schedule schedule);
	public int updateReadSchedule(Schedule schedule);
	public int deleteSchedule(Schedule schedule);
}
