--------------------------------------------------------
--  DDL for Package PKG_EXAM_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_EXAM_MAS" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_branch       exam_mas.branch%type, 
    p_batch_id     exam_mas.batch_id%type, 
    p_exam_id      out exam_mas.exam_id %type, 
    p_ref_sub_id   exam_mas.ref_sub_id%type, 
    p_total_mark   exam_mas.total_mark%type, 
    p_exam_type    exam_mas.exam_type%type, 
    p_type_det     exam_mas.type_det%type, 
    p_paper_set_by exam_mas.paper_set_by%type, 
    p_exam_date    exam_mas.exam_date%type, 
    p_exam_time    exam_mas.exam_time%type, 
    p_duration     exam_mas.duration%type, 
    p_supervisor   exam_mas.supervisor%type, 
    p_ent_term     exam_mas.ent_term%type, 
    p_ent_user     exam_mas.ent_user%type, 
    p_time_stamp   out exam_mas.time_stamp%type, 
    p_flg          out varchar2, 
    p_msg          out varchar2 ); 
    
  procedure prc_mas_upd( 
    p_branch       exam_mas.branch%type, 
    p_batch_id     exam_mas.batch_id%type, 
    p_exam_id      exam_mas.exam_id %type, 
    p_ref_sub_id   exam_mas.ref_sub_id%type, 
    p_total_mark   exam_mas.total_mark%type, 
    p_exam_type    exam_mas.exam_type%type, 
    p_type_det     exam_mas.type_det%type, 
    p_paper_set_by exam_mas.paper_set_by%type, 
    p_exam_date    exam_mas.exam_date%type, 
    p_exam_time    exam_mas.exam_time%type, 
    p_duration     exam_mas.duration%type, 
    p_supervisor   exam_mas.supervisor%type, 
    p_upd_term     exam_mas.ent_term%type, 
    p_upd_user     exam_mas.ent_user%type, 
    p_time_stamp   in out exam_mas.time_stamp%type, 
    p_flg          out varchar2, 
    p_msg          out varchar2 ); 
    
  procedure prc_mas_del( 
    p_exam_id exam_mas.exam_id%type, 
    p_flg     out varchar2, 
    p_msg     out varchar2 ); 
    
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
    
end pkg_exam_mas;

/
