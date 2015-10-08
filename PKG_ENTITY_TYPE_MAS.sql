--------------------------------------------------------
--  DDL for Package PKG_ENTITY_TYPE_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_ENTITY_TYPE_MAS" AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
type ref_cur is REF CURSOR;

procedure prc_fetch_data(p_criteria varchar2, p_data out ref_cur);

END PKG_ENTITY_TYPE_MAS;

/
