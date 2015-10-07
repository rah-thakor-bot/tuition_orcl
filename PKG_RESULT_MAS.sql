--------------------------------------------------------
--  DDL for Package PKG_RESULT_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_RESULT_MAS" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_exam_id        result_mas.exam_id%type, 
    p_entity_id      result_mas.entity_id%type, 
    p_entity_type_id result_mas.entity_type_id%type, 
    p_score          result_mas.score%type, 
    p_remark         result_mas.remark%type, 
    p_srno           out result_mas.srno%type, 
    p_ent_term       result_mas.ent_term%type, 
    p_ent_user       result_mas.ent_user%type, 
    p_time_stamp     out result_mas.time_stamp%type, 
    p_flg            out varchar2, 
    p_msg            out varchar2 ); 
  procedure prc_mas_upd( 
    p_exam_id        result_mas.exam_id%type, 
    p_entity_id      result_mas.entity_id%type, 
    p_entity_type_id result_mas.entity_type_id%type, 
    p_score          result_mas.score%type, 
    p_remark         result_mas.remark%type, 
    p_srno           result_mas.srno%type, 
    p_upd_term       result_mas.upd_term%type, 
    p_upd_user       result_mas.upd_user%type, 
    p_time_stamp     in out exam_mas.time_stamp%type, 
    p_flg            out varchar2, 
    p_msg            out varchar2 ); 
  procedure prc_mas_del( 
    p_srno result_mas.srno%type, 
    p_flg  out varchar2, 
    p_msg  out varchar2 ); 
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
end pkg_result_mas;

/
