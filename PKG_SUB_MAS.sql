--------------------------------------------------------
--  DDL for Package PKG_SUB_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_SUB_MAS" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_branch     sub_mas.branch%type, 
    p_ref_std_id sub_mas.ref_std_id%type, 
    p_sub_id     out sub_mas.sub_id%type, 
    p_sub_name   sub_mas.sub_name%type, 
    p_have_exam  sub_mas.have_exam%type, 
    p_is_active  sub_mas.is_active%type, 
    p_ent_user   sub_mas.ent_user%type, 
    p_ent_term   sub_mas.ent_term%type, 
    p_time_stamp out sub_mas.time_stamp%type, 
    p_flg        out varchar2, 
    p_msg        out varchar2 ); 
  procedure prc_mas_upd( 
    p_branch     sub_mas.branch%type, 
    p_ref_std_id sub_mas.ref_std_id%type, 
    p_sub_id     sub_mas.sub_id%type, 
    p_sub_name   sub_mas.sub_name%type, 
    p_have_exam  sub_mas.have_exam%type, 
    p_is_active  sub_mas.is_active%type, 
    p_upd_term   sub_mas.ent_term%type, 
    p_upd_user   sub_mas.ent_user%type, 
    p_time_stamp in out sub_mas.time_stamp%type, 
    p_flg        out varchar2, 
    p_msg        out varchar2 ); 
  procedure prc_mas_del( 
    p_branch sub_mas.branch%type, 
    p_sub_id sub_mas.sub_id%type, 
    p_flg    out varchar2, 
    p_msg    out varchar2 ); 
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_sub_data out REF_CUR, 
    p_chp_data out REF_CUR ); 
end pkg_sub_mas;

/
