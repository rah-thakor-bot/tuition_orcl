--------------------------------------------------------
--  DDL for Table STUD_MAS
--------------------------------------------------------

  CREATE TABLE "HR"."STUD_MAS" 
   (	"STUD_ID" NUMBER, 
	"S_ENTITY_ID" NUMBER, 
	"S_FNAME" VARCHAR2(30 BYTE), 
	"S_MNAME" VARCHAR2(30 BYTE), 
	"S_LNAME" VARCHAR2(30 BYTE), 
	"DOB" DATE, 
	"PHOTO" CLOB, 
	"PH1" NUMBER, 
	"PH2" NUMBER, 
	"SCHL_ID" NUMBER, 
	"PER" NUMBER, 
	"DOJ" DATE, 
	"BLD_GRP" VARCHAR2(10 BYTE), 
	"SEX" VARCHAR2(1 BYTE), 
	"REMARK" VARCHAR2(150 BYTE), 
	"ENT_DATE" DATE, 
	"ENT_USER" VARCHAR2(30 BYTE), 
	"ENT_TERM" VARCHAR2(30 BYTE), 
	"UPD_DATE" DATE, 
	"UPD_USER" VARCHAR2(30 BYTE), 
	"UPD_TERM" VARCHAR2(30 BYTE), 
	"TIME_STAMP" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645)
  TABLESPACE "USERS" 
 LOB ("PHOTO") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING ) ;
