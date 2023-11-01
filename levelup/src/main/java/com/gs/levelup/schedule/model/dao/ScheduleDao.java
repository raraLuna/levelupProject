package com.gs.levelup.schedule.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gs.levelup.common.Paging;
import com.gs.levelup.notice.model.vo.Notice;
import com.gs.levelup.schedule.model.vo.Schedule;

@Repository("scheduleDao")
public class ScheduleDao {
	@Autowired	//root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	//스케줄 전체 조회
	public ArrayList<Schedule> selectScheduleList(String employeeId, String teamId, String departmentId){
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("employeeId", employeeId);
	    parameters.put("teamId", teamId);
	    parameters.put("departmentId", departmentId);
		
		List<Schedule> list = sqlSessionTemplate.selectList("scheduleMapper.selectScheduleList", parameters);
		return (ArrayList<Schedule>)list;
	}
	
	//스케줄 오늘것만 조회
		public ArrayList<Schedule> selectTDScheduleList(String employeeId, String teamId, String departmentId){
			Map<String, Object> parameters = new HashMap<>();
		    parameters.put("employeeId", employeeId);
		    parameters.put("teamId", teamId);
		    parameters.put("departmentId", departmentId);
			
			List<Schedule> list = sqlSessionTemplate.selectList("scheduleMapper.selectTDScheduleList", parameters);
			return (ArrayList<Schedule>)list;
		}
	
	//새 스케줄 등록
	public int insertSchedule(Schedule schedule) {
		return sqlSessionTemplate.insert("scheduleMapper.insertSchedule", schedule);
	}
	
	//스케줄 수정
	public int updateSchedule(Schedule schedule) {
		return sqlSessionTemplate.update("scheduleMapper.updateSchedule", schedule);
	}
	
	//스케줄 수정
		public int updateReadSchedule(Schedule schedule) {
			return sqlSessionTemplate.update("scheduleMapper.updateReadSchedule", schedule);
		}
	
	//스케줄 삭제
	public int deleteSchedule(Schedule schedule) {
		return sqlSessionTemplate.delete("scheduleMapper.deleteSchedule", schedule);
	}

}
