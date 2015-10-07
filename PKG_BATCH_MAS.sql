--------------------------------------------------------
--  DDL for Package PKG_BATCH_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_BATCH_MAS" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_branch          batch_mas.branch%type, 
    p_batch_id        out batch_mas.batch_id%type, 
    p_batch_name      batch_mas.batch_name%type, 
    p_ref_sub_id      batch_mas.ref_sub_id%type, 
    p_ref_t_entity_id batch_mas.ref_t_entity_id%type, 
    p_fr_time         batch_mas.fr_time%type, 
    p_to_time         batch_mas.to_time%type, 
    p_is_active       batch_mas.is_active%type, 
    p_ent_term        batch_mas.ent_term%type, 
    p_ent_user        batch_mas.ent_user%type, 
    p_time_stamp      out batch_mas.time_stamp%type, 
    p_flg             out varchar2, 
    p_msg             out varchar2 ); 
    
  procedure prc_mas_upd( 
    p_branch          batch_mas.branch%type, 
    p_batch_id        batch_mas.batch_id%type, 
    p_batch_name      batch_mas.batch_name%type, 
    p_ref_sub_id      batch_mas.ref_sub_id%type, 
    p_ref_t_entity_id batch_mas.ref_t_entity_id%type, 
    p_fr_time         batch_mas.fr_time%type, 
    p_to_time         batch_mas.to_time%type, 
    p_is_active       batch_mas.is_active%type, 
    p_upd_term        batch_mas.ent_term%type, 
    p_upd_user        batch_mas.ent_user%type, 
    p_time_stamp      in out batch_mas.time_stamp%type, 
    p_flg             out varchar2, 
    p_msg             out varchar2 ); 
    
  procedure prc_mas_del( 
    p_batch_id batch_mas.batch_id%type, 
    p_flg      out varchar2, 
    p_msg      out varchar2 ); 
    
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
    
end pkg_batch_mas;

/
