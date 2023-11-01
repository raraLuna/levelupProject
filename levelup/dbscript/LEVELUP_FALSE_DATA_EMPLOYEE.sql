insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '사원'), 
'한창현', 
'zxcqwgks@kakao.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
NULL);

insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '사원'),  
'안태환', 
'tatha000@naver.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
NULL);

insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '사원'), 
'김지혁', 
'kimjihyuk5935@gmail.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
NULL);

insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '사원'),  
'오상민', 
'osm1525@naver.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
NULL);

insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '사원'), 
'김화범', 
'kazz9000@gmail.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
NULL);

insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '사원'), 
'최유미', 
'rarayo44@gmail.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
NULL);


UPDATE EMPLOYEE
SET employee_email = 'tatha000@naver.com'
WHERE EMPLOYEE_NAME = '안태환';

UPDATE EMPLOYEE
SET employee_email = 'kimjihyuk5935@gmail.com'
WHERE EMPLOYEE_NAME = '김지혁';

UPDATE EMPLOYEE
SET employee_email = 'osm1525@naver.com'
WHERE EMPLOYEE_NAME = '오상민';

UPDATE EMPLOYEE
SET employee_email = 'rarayo44@gmail.com'
WHERE EMPLOYEE_NAME = '최유미';

UPDATE EMPLOYEE
SET employee_email = 'zxcqwgks@kakao.com'
WHERE EMPLOYEE_NAME = '한창현';

----------테스트용 관리자 사원 가데이터 추가----------

insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '차장'), 
'호랑이', 
'admin1@admin.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
NULL);

insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '과장'), 
'피카츄', 
'admin3@admin.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
(SELECT EMPLOYEE_ID FROM EMPLOYEE WHERE EMPLOYEE_NAME = '호랑이'));

insert into employee 
values(SYS_GUID(), 
(SELECT DEPARTMENT_ID FROM DEPARTMENT WHERE DEPARTMENT_NAME = '개발부'), 
(SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '백엔드'),  
(SELECT RANK_ID FROM RANK WHERE RANK_NAME = '대리'), 
'김대리', 
'admin2@admin.com', 
'1111', 
'서울', 
'010-1234-5678', 
SYSDATE,
(SELECT EMPLOYEE_ID FROM EMPLOYEE WHERE EMPLOYEE_NAME = '피카츄'));


COMMIT;