--------------------------------------------------------
--  DDL for Package PKG_CHP_DET
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_CHP_DET" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_ref_sub_id  chp_det.ref_sub_id%type, 
    p_seqno       out chp_det.seqno%type, 
    p_chp_id      chp_det.chp_id%type, 
    p_chp_name    chp_det.chp_name%type, 
    p_description chp_det.description%type, 
    p_remark      chp_det.remark%type, 
    p_ent_term    chp_det.ent_term%type, 
    p_ent_user    chp_det.ent_user%type, 
    p_time_stamp  out chp_det.time_stamp%type, 
    p_flg         out varchar2, 
    p_msg         out varchar2 ); 
  --------------------------------------- 
  procedure prc_mas_upd( 
    p_ref_sub_id  chp_det.ref_sub_id%type, 
    p_seqno       chp_det.seqno%type, 
    p_chp_id      chp_det.chp_id%type, 
    p_chp_name    chp_det.chp_name%type, 
    p_description chp_det.description%type, 
    p_remark      chp_det.remark%type, 
    p_upd_term    chp_det.ent_term%type, 
    p_upd_user    chp_det.ent_user%type, 
    p_time_stamp  in out chp_det.time_stamp%type, 
    p_flg         out varchar2, 
    p_msg         out varchar2 ); 
  --------------------------------------------------- 
  procedure prc_mas_del( 
    p_seqno chp_det.seqno%type, 
    p_flg   out varchar2, 
    p_msg   out varchar2 ); 
  --------------------------------------------------- 
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
end pkg_chp_det;

/
