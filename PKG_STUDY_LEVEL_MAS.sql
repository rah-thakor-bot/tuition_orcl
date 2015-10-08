--------------------------------------------------------
--  DDL for Package PKG_STUDY_LEVEL_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_STUDY_LEVEL_MAS" 
as 
  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_branch_id  study_level_mas.branch%type, 
    p_std_id     out study_level_mas.std_id%type, 
    p_std_level  study_level_mas.std_level%type, 
    p_std_med    study_level_mas.std_medium%type, 
    p_std_type   study_level_mas.std_type%type, 
    p_std_name   study_level_mas.std_name%type, 
    p_is_active  study_level_mas.is_active%type, 
    p_ent_user   study_level_mas.ent_user%type, 
    p_ent_term   study_level_mas.ent_term%type, 
    p_time_stamp in out study_level_mas.time_stamp%type, 
    p_flg        out varchar2, 
    p_msg        out varchar2 ); 
  procedure prc_mas_upd( 
    p_branch_id  study_level_mas.branch%type, 
    p_std_id     study_level_mas.std_id%type, 
    p_std_level  study_level_mas.std_level%type, 
    p_std_med    study_level_mas.std_medium%type, 
    p_std_type   study_level_mas.std_type%type, 
    p_std_name   study_level_mas.std_name%type, 
    p_is_active  study_level_mas.is_active%type, 
    p_upd_user   study_level_mas.upd_user%type, 
    p_upd_term   study_level_mas.upd_term%type, 
    p_time_stamp in out study_level_mas.time_stamp%type, 
    p_flg        out varchar2, 
    p_msg        out varchar2 ); 
  procedure prc_mas_del( 
    p_branch_id study_level_mas.branch%type, 
    p_std_id    study_level_mas.std_id%type, 
    p_flg       out varchar2, 
    p_msg       out varchar2 ); 
  procedure prc_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
end pkg_study_level_mas;

/
