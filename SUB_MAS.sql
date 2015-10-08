--------------------------------------------------------
--  DDL for Table SUB_MAS
--------------------------------------------------------

  CREATE TABLE "HR"."SUB_MAS" 
   (	"BRANCH" VARCHAR2(20 BYTE), 
	"REF_STD_ID" NUMBER, 
	"SUB_ID" NUMBER, 
	"SUB_NAME" VARCHAR2(50 BYTE), 
	"HAVE_EXAM" VARCHAR2(1 BYTE), 
	"IS_ACTIVE" VARCHAR2(1 BYTE), 
	"ENT_DATE" DATE, 
	"ENT_TERM" VARCHAR2(20 BYTE), 
	"ENT_USER" VARCHAR2(20 BYTE), 
	"UPD_DATE" DATE, 
	"UPD_USER" VARCHAR2(20 BYTE), 
	"UPD_TERM" VARCHAR2(20 BYTE), 
	"TIME_STAMP" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;