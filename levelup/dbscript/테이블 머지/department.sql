--------------------------------------------------------
--  파일이 생성됨 - 금요일-10월-20-2023   
--------------------------------------------------------
DROP TABLE "DEPARTMENT" cascade constraints;
--------------------------------------------------------
--  DDL for Table DEPARTMENT
--------------------------------------------------------

  CREATE TABLE "DEPARTMENT" 
   (	"DEPARTMENT_ID" VARCHAR2(32), 
	"DEPARTMENT_NAME" VARCHAR2(32)
   ) 

   COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_ID" IS '부서 ID'
   COMMENT ON COLUMN "DEPARTMENT"."DEPARTMENT_NAME" IS '부서명'
   COMMENT ON TABLE "DEPARTMENT"  IS '부서'
REM INSERTING into DEPARTMENT
SET DEFINE OFF;
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME) values ('dev','개발부');
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME) values ('marketing','영업부');
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME) values ('trade','무역부');
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME) values ('accounting','경리부');
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME) values ('none','미정');
--------------------------------------------------------
--  DDL for Index PK_DEPARTMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_DEPARTMENT" ON "DEPARTMENT" ("DEPARTMENT_ID")
--------------------------------------------------------
--  Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTMENT" MODIFY ("DEPARTMENT_ID" NOT NULL ENABLE)
  ALTER TABLE "DEPARTMENT" MODIFY ("DEPARTMENT_NAME" NOT NULL ENABLE)
  ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX  ENABLE
