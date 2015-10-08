--------------------------------------------------------
--  Ref Constraints for Table ATTENDANCE_MAS
--------------------------------------------------------

  ALTER TABLE "HR"."ATTENDANCE_MAS" ADD CONSTRAINT "ATND_MAS_FK_ENTITY_ID" FOREIGN KEY ("ENTITY_ID")
	  REFERENCES "HR"."ENTITY_MAS" ("ENTITY_ID") ENABLE;
 
  ALTER TABLE "HR"."ATTENDANCE_MAS" ADD CONSTRAINT "ATND_MAS_FK_ENTITY_TYPE" FOREIGN KEY ("ENTITY_TYPE_ID")
	  REFERENCES "HR"."ENTITY_TYPE_MAS" ("ENTITY_TYPE_ID") ENABLE;