--------------------------------------------------------
--  DDL for Index RESULT_MAS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."RESULT_MAS_UK1" ON "HR"."RESULT_MAS" ("EXAM_ID", "ENTITY_ID", "ENTITY_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
