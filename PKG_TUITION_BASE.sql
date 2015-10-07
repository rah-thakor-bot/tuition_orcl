--------------------------------------------------------
--  DDL for Package PKG_TUITION_BASE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_TUITION_BASE" 
as 
  type ref_cur is ref cursor; 
  -- 
  -- Get Grid fields details 
  -- 
  procedure prc_fetch_grid_fields( 
    p_menu_name varchar2, 
    p_ctrl_name varchar2, 
    p_data      out REF_CUR); 
  -- 
  -- Get Sub List 
  -- 
  procedure prc_get_sub_list( 
    p_std_id         varchar2, 
    p_subject_status varchar2, 
    p_data           out REF_CUR); 
  -- 
  -- Get Chapter details 
  -- 
  procedure prc_get_chp_list( 
    p_sub_id varchar2, 
    p_data   out REF_CUR); 
  -- 
  -- Get Std Type 
  -- 
  procedure prc_get_std_type( 
    p_data out REF_CUR); 
  -- 
  -- Get Std Combo Active/InActive 
  -- 
  procedure prc_get_std_list( 
    p_branch     varchar2, 
    p_std_status varchar2, 
    p_std_list   out REF_CUR ); 
  procedure prc_get_std_medium( 
    p_data out REF_CUR); 
  procedure prc_get_teacher_list( 
    flg    varchar, 
    p_data out REF_CUR); 
  procedure prc_get_batch_list( 
    flg    varchar, 
    p_data out REF_CUR); 
  procedure prc_get_entity_type( 
    flg    varchar, 
    p_data out REF_CUR); 
  procedure prc_get_static_combo( 
    p_static_flg varchar2, 
    p_data       out REF_CUR); 
  procedure prc_get_exam_list( 
    p_exam_flg varchar2, 
    p_data     out REF_CUR); 
  procedure prc_get_emp_list( 
    p_entity_type varchar2, 
    p_is_active   varchar2, 
    p_data        out REF_CUR); 
  function fun_get_data_err 
  return varchar2; 
  function fun_get_save_msg 
  return varchar2; 
  function fun_get_update_msg 
  return varchar2; 
  function fun_get_delete_msg 
  return varchar2; 
  function fun_get_save_err 
  return varchar2; 
  function fun_get_update_err 
  return varchar2; 
  function fun_get_delete_err 
  return varchar2; 
  function fun_get_timestamp_err 
  return varchar2; 
end pkg_tuition_base;

/
