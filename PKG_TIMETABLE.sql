--------------------------------------------------------
--  DDL for Package PKG_TIMETABLE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_TIMETABLE" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_branch_id       timetable.branch%type, 
    p_batch_id        timetable.batch_id%type, 
    p_t_date          timetable.t_date%type, 
    p_fr_time         timetable.fr_time%type, 
    p_to_time         timetable.to_time%type, 
    p_ref_sub_id      timetable.ref_sub_id%type, 
    p_ref_t_entity_id timetable.ref_t_entity_id%type, 
    p_ent_term        timetable.ent_term%type, 
    p_ent_user        timetable.ent_user%type, 
    p_time_stamp      out timetable.time_stamp%type, 
    p_flg             out varchar2, 
    p_msg             out varchar2 ); 
  procedure prc_mas_upd( 
    p_branch          timetable.branch%type, 
    p_batch_id        timetable.batch_id%type, 
    p_t_date          timetable.t_date%type, 
    p_fr_time         timetable.fr_time%type, 
    p_to_time         timetable.to_time%type, 
    p_ref_sub_id      timetable.ref_sub_id%type, 
    p_ref_t_entity_id timetable.ref_t_entity_id%type, 
    p_upd_term        timetable.ent_term%type, 
    p_upd_user        timetable.ent_user%type, 
    p_time_stamp      in out timetable.time_stamp%type, 
    p_flg             out varchar2, 
    p_msg             out varchar2 ); 
  procedure prc_mas_del( 
    p_uniqid timetable.batch_id%type, 
    p_flg    out varchar2, 
    p_msg    out varchar2 ); 
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
end pkg_timetable;

/
