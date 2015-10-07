--------------------------------------------------------
--  Ref Constraints for Table CHP_DET
--------------------------------------------------------

  ALTER TABLE "HR"."CHP_DET" ADD CONSTRAINT "CHP_DET_FK_SUB_ID" FOREIGN KEY ("REF_SUB_ID")
	  REFERENCES "HR"."SUB_MAS" ("SUB_ID") ENABLE;
