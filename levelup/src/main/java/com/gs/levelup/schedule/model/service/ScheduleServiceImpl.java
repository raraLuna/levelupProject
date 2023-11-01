package com.gs.levelup.schedule.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gs.levelup.schedule.model.dao.ScheduleDao;
import com.gs.levelup.schedule.model.vo.Schedule;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired	//자동 DI 처리됨 : 자동 객체 생성됨
	private ScheduleDao scheduleDao;
	
	@Override
	public ArrayList<Schedule> selectScheduleList(String employeeId, String teamId, String departmentId){
		return scheduleDao.selectScheduleList(employeeId, teamId, departmentId);
	}
	
	@Override
	public ArrayList<Schedule> selectTDScheduleList(String employeeId, String teamId, String departmentId){
		return scheduleDao.selectTDScheduleList(employeeId, teamId, departmentId);
	}
	@Override
	public int insertSchedule(Schedule schedule) {
		return scheduleDao.insertSchedule(schedule);
	}
	@Override
	public int updateSchedule(Schedule schedule) {
		return scheduleDao.updateSchedule(schedule);
	}
	@Override
	public int updateReadSchedule(Schedule schedule) {
		return scheduleDao.updateReadSchedule(schedule);
	}
	
	@Override
	public int deleteSchedule(Schedule schedule) {
		return scheduleDao.deleteSchedule(schedule);
	}
	
	
	
	
}
