--------------------------------------------------------
--  DDL for Index TIMETABLE_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."TIMETABLE_UK1" ON "HR"."TIMETABLE" ("BRANCH", "BATCH_ID", "T_DATE", "REF_SUB_ID", "REF_T_ENTITY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
