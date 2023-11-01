--------------------------------------------------------
--  파일이 생성됨 - 금요일-10월-20-2023   
--------------------------------------------------------
DROP TABLE "RANK" cascade constraints;
--------------------------------------------------------
--  DDL for Table RANK
--------------------------------------------------------

  CREATE TABLE "RANK" 
   (	"RANK_ID" VARCHAR2(32), 
	"RANK_NAME" VARCHAR2(32)
   ) 

   COMMENT ON COLUMN "RANK"."RANK_ID" IS '직급 ID'
   COMMENT ON COLUMN "RANK"."RANK_NAME" IS '직급명'
   COMMENT ON TABLE "RANK"  IS '직급'
REM INSERTING into RANK
SET DEFINE OFF;
Insert into RANK (RANK_ID,RANK_NAME) values ('emp','사원');
Insert into RANK (RANK_ID,RANK_NAME) values ('intern','인턴');
Insert into RANK (RANK_ID,RANK_NAME) values ('chief','주임');
Insert into RANK (RANK_ID,RANK_NAME) values ('senior','대리');
Insert into RANK (RANK_ID,RANK_NAME) values ('jman','과장');
Insert into RANK (RANK_ID,RANK_NAME) values ('sman','차장');
Insert into RANK (RANK_ID,RANK_NAME) values ('jdirec','전무');
Insert into RANK (RANK_ID,RANK_NAME) values ('direc','이사');
Insert into RANK (RANK_ID,RANK_NAME) values ('ceo','CEO');
--------------------------------------------------------
--  DDL for Index PK_RANK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RANK" ON "RANK" ("RANK_ID")
--------------------------------------------------------
--  Constraints for Table RANK
--------------------------------------------------------

  ALTER TABLE "RANK" MODIFY ("RANK_ID" NOT NULL ENABLE)
  ALTER TABLE "RANK" MODIFY ("RANK_NAME" NOT NULL ENABLE)
  ALTER TABLE "RANK" ADD CONSTRAINT "PK_RANK" PRIMARY KEY ("RANK_ID")
  USING INDEX  ENABLE
