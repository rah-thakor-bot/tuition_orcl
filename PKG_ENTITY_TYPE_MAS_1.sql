--------------------------------------------------------
--  DDL for Package Body PKG_ENTITY_TYPE_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_ENTITY_TYPE_MAS" AS

  procedure prc_fetch_data(p_criteria varchar2, p_data out ref_cur) AS
  BEGIN
    -- TODO: Implementation required for procedure PKG_ENTITY_TYPE_MAS.prc_fetch_data
    open p_data for 
         select * from ENTITY_TYPE_MAS a;

    exception when others then
      RAISE_APPLICATION_ERROR(-20001, 'Problem in Fetching Entity Type Master');
  END prc_fetch_data;

END PKG_ENTITY_TYPE_MAS;

/
