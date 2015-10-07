--------------------------------------------------------
--  DDL for Index ATTENDANCE_MAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HR"."ATTENDANCE_MAS_PK" ON "HR"."ATTENDANCE_MAS" ("SEQNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
