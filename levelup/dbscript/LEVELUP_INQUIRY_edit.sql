insert into member
values('test1', 2);

insert into member
values('test2', 3);

insert into member
values('test3', 4);


insert into member
values('test4', 5);

insert into member
values('test5', 6);

commit;

rollback;

INSERT INTO MEMBER
VALUES('kazz900', 1);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member1',
NULL,
'테스트 문의글1 입니다',
'테스트 문의글1 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'1');

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 문의글2 입니다',
'테스트 문의글2 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'1');

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 문의글3 입니다',
'테스트 문의글3 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'1');


INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 게임문의4 입니다',
'테스트 게임문의4 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'2',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 게임문의5 입니다',
'테스트 게임문의5 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'2',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 게임문의6 입니다',
'테스트 게임문의6 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'2',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 게임문의7 입니다',
'테스트 게임문의7 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'2',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 게임문의8 입니다',
'테스트 게임문의8 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'2',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 게임문의9 입니다',
'테스트 게임문의9 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'2',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 게임문의10 입니다',
'테스트 게임문의10 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'2',
DEFAULT,
DEFAULT);

-------------------------------------------------------

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의1 입니다',
'테스트 기타문의1 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의2 입니다',
'테스트 기타문의2 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의3 입니다',
'테스트 기타문의3 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의3 입니다',
'테스트 기타문의3 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의4 입니다',
'테스트 기타문의4 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의5 입니다',
'테스트 기타문의5 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의6 입니다',
'테스트 기타문의6 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의7 입니다',
'테스트 기타문의7 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의8 입니다',
'테스트 기타문의8 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

INSERT INTO INQUIRY
VALUES(
DEFAULT,
'member2',
NULL,
'테스트 기타문의9 입니다',
'테스트 기타문의9 입니다',
DEFAULT,
SYSDATE,
NULL,
NULL,
NULL,
'3',
DEFAULT,
DEFAULT);

UPDATE INQUIRY
SET INQUIRY_REF = INQUIRY_ID;

COMMIT;

 