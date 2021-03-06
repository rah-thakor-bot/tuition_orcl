--------------------------------------------------------
--  Constraints for Table ENTITY_TYPE_MAS
--------------------------------------------------------

  ALTER TABLE "HR"."ENTITY_TYPE_MAS" ADD CONSTRAINT "ENTITY_TYPE_MAS_PK" PRIMARY KEY ("ENTITY_TYPE_ID", "ENTITY_TYPE_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."ENTITY_TYPE_MAS" MODIFY ("ENTITY_TYPE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ENTITY_TYPE_MAS" MODIFY ("ENTITY_TYPE_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ENTITY_TYPE_MAS" MODIFY ("ENT_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ENTITY_TYPE_MAS" MODIFY ("ENT_USER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ENTITY_TYPE_MAS" MODIFY ("ENT_TERM" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ENTITY_TYPE_MAS" MODIFY ("TIME_STAMP" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."ENTITY_TYPE_MAS" ADD CONSTRAINT "UK_ENTITY_TYPE_ID" UNIQUE ("ENTITY_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
