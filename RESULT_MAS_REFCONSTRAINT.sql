--------------------------------------------------------
--  Ref Constraints for Table RESULT_MAS
--------------------------------------------------------

  ALTER TABLE "HR"."RESULT_MAS" ADD CONSTRAINT "RESULT_MAS_FK_ID" FOREIGN KEY ("ENTITY_ID")
	  REFERENCES "HR"."ENTITY_MAS" ("ENTITY_ID") ENABLE;
 
  ALTER TABLE "HR"."RESULT_MAS" ADD CONSTRAINT "RESULT_MAS_FK_TYPE" FOREIGN KEY ("ENTITY_TYPE_ID")
	  REFERENCES "HR"."ENTITY_TYPE_MAS" ("ENTITY_TYPE_ID") ENABLE;
