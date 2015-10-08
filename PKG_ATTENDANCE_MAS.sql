--------------------------------------------------------
--  DDL for Package PKG_ATTENDANCE_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_ATTENDANCE_MAS" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_seqno           out attendance_mas.seqno%type, 
    p_entity_id       attendance_mas.entity_id%type, 
    p_entity_type_id  attendance_mas.entity_type_id%type, 
    p_batch_id        attendance_mas.batch_id%type, 
    p_attendance_date attendance_mas.attendance_date%type, 
    p_attendance_time attendance_mas.attendance_time%type, 
    p_attendance_flg  attendance_mas.flg%type, 
    p_ent_term        attendance_mas.ent_term%type, 
    p_ent_user        attendance_mas.ent_user%type, 
    p_time_stamp      out attendance_mas.time_stamp%type, 
    p_flg             out varchar2, 
    p_msg             out varchar2 ); 
    
  procedure prc_mas_upd( 
    p_seqno           attendance_mas.seqno%type, 
    p_entity_id       attendance_mas.entity_id%type, 
    p_entity_type_id  attendance_mas.entity_type_id%type, 
    p_batch_id        attendance_mas.batch_id%type, 
    p_attendance_date attendance_mas.attendance_date%type, 
    p_attendance_time attendance_mas.attendance_time%type, 
    p_attendance_flg  attendance_mas.flg%type, 
    p_upd_term        attendance_mas.upd_term%type, 
    p_upd_user        attendance_mas.upd_user%type, 
    p_time_stamp      in out attendance_mas.time_stamp%type, 
    p_flg             out varchar2, 
    p_msg             out varchar2 ); 
    
  procedure prc_mas_del( 
    p_seqno attendance_mas.seqno%type, 
    p_flg   out varchar2, 
    p_msg   out varchar2 ); 
    
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
    
end pkg_attendance_mas;

/
