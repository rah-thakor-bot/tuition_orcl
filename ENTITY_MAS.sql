--------------------------------------------------------
--  DDL for Table ENTITY_MAS
--------------------------------------------------------

  CREATE TABLE "HR"."ENTITY_MAS" 
   (	"ENTITY_ID" NUMBER, 
	"ENTITY_TYPE_ID" NUMBER, 
	"ENTITY_NAME" VARCHAR2(50 BYTE), 
	"IS_ACTIVE" VARCHAR2(1 BYTE), 
	"ENT_DATE" VARCHAR2(30 BYTE), 
	"ENT_USER" VARCHAR2(30 BYTE), 
	"ENT_TERM" VARCHAR2(30 BYTE), 
	"UPD_DATE" DATE, 
	"UPD_USER" VARCHAR2(30 BYTE), 
	"UPD_TERM" VARCHAR2(30 BYTE), 
	"TIME_STAMP" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
