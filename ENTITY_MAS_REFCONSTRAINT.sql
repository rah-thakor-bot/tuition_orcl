--------------------------------------------------------
--  Ref Constraints for Table ENTITY_MAS
--------------------------------------------------------

  ALTER TABLE "HR"."ENTITY_MAS" ADD CONSTRAINT "ENTITY_MAS_FK_TYPE_ID" FOREIGN KEY ("ENTITY_TYPE_ID")
	  REFERENCES "HR"."ENTITY_TYPE_MAS" ("ENTITY_TYPE_ID") ENABLE;
