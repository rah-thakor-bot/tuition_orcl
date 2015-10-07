--------------------------------------------------------
--  Ref Constraints for Table EXAM_MAS
--------------------------------------------------------

  ALTER TABLE "HR"."EXAM_MAS" ADD CONSTRAINT "EXAM_MAS_FK_BATCH_ID" FOREIGN KEY ("BATCH_ID")
	  REFERENCES "HR"."BATCH_MAS" ("BATCH_ID") ENABLE;
 
  ALTER TABLE "HR"."EXAM_MAS" ADD CONSTRAINT "EXAM_MAS_FK_SUB_ID" FOREIGN KEY ("REF_SUB_ID")
	  REFERENCES "HR"."SUB_MAS" ("SUB_ID") ENABLE;
