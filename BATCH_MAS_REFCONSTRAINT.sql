--------------------------------------------------------
--  Ref Constraints for Table BATCH_MAS
--------------------------------------------------------

  ALTER TABLE "HR"."BATCH_MAS" ADD CONSTRAINT "BTCH_MAS_FK_ENNTITY_TYPE_ID" FOREIGN KEY ("REF_T_ENTITY_ID")
	  REFERENCES "HR"."ENTITY_MAS" ("ENTITY_ID") ENABLE;
 
  ALTER TABLE "HR"."BATCH_MAS" ADD CONSTRAINT "BTCH_MAS_FK_SUB_ID" FOREIGN KEY ("REF_SUB_ID")
	  REFERENCES "HR"."SUB_MAS" ("SUB_ID") ENABLE;
