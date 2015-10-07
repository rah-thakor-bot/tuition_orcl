--------------------------------------------------------
--  Constraints for Table EMP_MAS
--------------------------------------------------------

  ALTER TABLE "HR"."EMP_MAS" ADD CONSTRAINT "EMP_MAS_PK" PRIMARY KEY ("ENTITY_ID", "BRANCH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."EMP_MAS" ADD CONSTRAINT "EMP_MAS_VALIDATE_SEX" CHECK (SEX IN ('M','F')) ENABLE;
 
  ALTER TABLE "HR"."EMP_MAS" MODIFY ("ENTITY_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMP_MAS" MODIFY ("F_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMP_MAS" MODIFY ("BRANCH" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMP_MAS" MODIFY ("ENT_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMP_MAS" MODIFY ("ENT_USER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMP_MAS" MODIFY ("ENT_TERM" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMP_MAS" MODIFY ("TIME_STAMP" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."EMP_MAS" ADD CONSTRAINT "UK_ENTITY_ID" UNIQUE ("ENTITY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
