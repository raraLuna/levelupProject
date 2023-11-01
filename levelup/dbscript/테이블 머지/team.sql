--------------------------------------------------------
--  파일이 생성됨 - 금요일-10월-20-2023   
--------------------------------------------------------
DROP TABLE "TEAM" cascade constraints;
--------------------------------------------------------
--  DDL for Table TEAM
--------------------------------------------------------

  CREATE TABLE "TEAM" 
   (	"TEAM_ID" VARCHAR2(32), 
	"TEAM_NAME" VARCHAR2(32)
   ) 

   COMMENT ON COLUMN "TEAM"."TEAM_ID" IS '팀 ID'
   COMMENT ON COLUMN "TEAM"."TEAM_NAME" IS '팀명'
   COMMENT ON TABLE "TEAM"  IS '팀'
REM INSERTING into TEAM
SET DEFINE OFF;
Insert into TEAM (TEAM_ID,TEAM_NAME) values ('backend','백엔드');
Insert into TEAM (TEAM_ID,TEAM_NAME) values ('webfront','프론트개발');
Insert into TEAM (TEAM_ID,TEAM_NAME) values ('anddev','안드로이드개발');
Insert into TEAM (TEAM_ID,TEAM_NAME) values ('iosdev','iOS개발');
Insert into TEAM (TEAM_ID,TEAM_NAME) values ('cs','고객서비스');
--------------------------------------------------------
--  DDL for Index PK_TEAM
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TEAM" ON "TEAM" ("TEAM_ID")
--------------------------------------------------------
--  Constraints for Table TEAM
--------------------------------------------------------

  ALTER TABLE "TEAM" MODIFY ("TEAM_ID" NOT NULL ENABLE)
  ALTER TABLE "TEAM" MODIFY ("TEAM_NAME" NOT NULL ENABLE)
  ALTER TABLE "TEAM" ADD CONSTRAINT "PK_TEAM" PRIMARY KEY ("TEAM_ID")
  USING INDEX  ENABLE
