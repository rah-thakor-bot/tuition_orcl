--------------------------------------------------------
--  Constraints for Table RESULT_MAS
--------------------------------------------------------

  ALTER TABLE "HR"."RESULT_MAS" ADD CONSTRAINT "DUP_CONS_UK" UNIQUE ("EXAM_ID", "ENTITY_ID", "ENTITY_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."RESULT_MAS" ADD CONSTRAINT "RESULT_MAS_PK" PRIMARY KEY ("SRNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "HR"."RESULT_MAS" MODIFY ("EXAM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RESULT_MAS" MODIFY ("ENTITY_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RESULT_MAS" MODIFY ("ENTITY_TYPE_ID" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RESULT_MAS" MODIFY ("SRNO" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RESULT_MAS" MODIFY ("ENT_DATE" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RESULT_MAS" MODIFY ("ENT_USER" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RESULT_MAS" MODIFY ("ENT_TERM" NOT NULL ENABLE);
 
  ALTER TABLE "HR"."RESULT_MAS" MODIFY ("TIME_STAMP" NOT NULL ENABLE);
