--------------------------------------------------------
--  DDL for Table GRID_FIELDS
--------------------------------------------------------

  CREATE TABLE "HR"."GRID_FIELDS" 
   (	"MENU_NAME" VARCHAR2(50 BYTE), 
	"CTRL_NAME" VARCHAR2(30 BYTE), 
	"DATA_FIELD_NAME" VARCHAR2(30 BYTE), 
	"FIELD_SIZE" NUMBER(3,0) DEFAULT 40, 
	"DISP_NAME" VARCHAR2(50 BYTE), 
	"COL_TYPE" VARCHAR2(75 BYTE), 
	"COMBO_FLG" VARCHAR2(20 BYTE), 
	"COMBO_BIND_ID" VARCHAR2(20 BYTE), 
	"EXCEL_FIELD_NAME" VARCHAR2(20 BYTE), 
	"REMARK" VARCHAR2(50 BYTE), 
	"EXTRA_REMARK" VARCHAR2(50 BYTE), 
	"ORD" NUMBER(4,0), 
	"SEQNO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
