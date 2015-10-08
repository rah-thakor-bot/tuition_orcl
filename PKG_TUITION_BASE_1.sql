--------------------------------------------------------
--  DDL for Package Body PKG_TUITION_BASE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_TUITION_BASE" 
as 
  -- 
  -- 
  --Get Grid fields 
  -- 
  -- 
  procedure prc_fetch_grid_fields(p_menu_name varchar2, 
                                  p_ctrl_name varchar2, 
                                  p_data      out REF_CUR) 
  as 
  begin 
      -- TODO: Implementation required for procedure 
      -- PKG_TUTIION_BASE.prc_fetch_grid_fields 
      open p_data for 
        select a.menu_name, 
               a.ctrl_name, 
               a.data_field_name, 
               a.field_size, 
               a.disp_name, 
               a.col_type, 
               a.combo_flg, 
               a.combo_bind_id, 
               a.excel_field_name, 
               a.remark, 
               a.extra_remark, 
               a.ord 
          from grid_fields a 
         where a.menu_name = p_menu_name 
           and a.ctrl_name = nvl(p_ctrl_name, a.ctrl_name); 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in Fetching Grid Fields Data'); 
  end prc_fetch_grid_fields; 
  -- 
  -- 
  --Get Active Subjects 
  -- 
  -- 
  procedure prc_get_sub_list(p_std_id         varchar2, 
                             p_subject_status varchar2, 
                             p_data           out REF_CUR) 
  as 
  begin 
      open p_data for 
        select s.ref_std_id, 
               s.sub_id, 
               s.sub_name 
          from sub_mas S 
         where S.ref_std_id = nvl(to_number(p_std_id), S.ref_std_id) 
           and S.is_active = nvl(p_subject_status, S.is_active); 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in fetching Subject Details' 
               ); 
  end; 
  -- 
  -- 
  -- Get Chapter Details with Subject 
  -- 
  -- 
  procedure prc_get_chp_list(p_sub_id varchar2, 
                             p_data   out REF_CUR) 
  as 
  begin 
      open p_data for 
        select C.seqno, 
               C.ref_sub_id, 
               C.chp_id, 
               C.chp_name, 
               C.description, 
               C.remark, 
               C.time_stamp 
          from chp_det C 
         where c.ref_sub_id = to_number(p_sub_id); 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in fetching Chapter Details' 
               ); 
  end; 
  -- 
  -- 
  -- Get Std Type 
  -- 
  -- 
  procedure prc_get_std_type(p_data out REF_CUR) 
  as 
  begin 
      open p_data for 
        select 'GUJARATI' as DISP_OPTION, 
               '1'        as value_member, 
               1          ord 
          from dual 
        union all 
        select 'ENGLISH', 
               '2', 
               2 
          from dual 
         order by ord; 
  end; 
  -- 
  -- Get Std Combo Active/InActive 
  -- 
  procedure prc_get_std_list(p_branch     varchar2, 
                             p_std_status varchar2, 
                             p_std_list   out REF_CUR) 
  as 
  begin 
      open p_std_list for 
        select a.std_id, 
               a.std_level 
               || ' - ' 
               || a.std_name 
               || ' - ' 
               || a.std_type as STD_NAME 
          from study_level_mas a 
         where a.branch = nvl(p_branch, a.branch) 
           and a.is_active = p_std_status; 
  exception 
    when others then 
               raise_application_error(-20001, 'Problem in fetching Std List'); 
  end; 
  procedure prc_get_std_medium(p_data out REF_CUR) 
  as 
  begin 
      open p_data for 
        select 'GBSE' as DISP_OPTION, 
               1      as value_member, 
               1      ord 
          from dual 
        union all 
        select 'CBSE', 
               2, 
               2 
          from dual 
        union all 
        select 'ICSE', 
               3, 
               3 
          from dual 
         order by 3; 
  exception 
    when others then 
               raise_application_error(-20001, 'Problem in fetching Std Medium') 
               ; 
  end; 
  procedure prc_get_teacher_list(flg    varchar, 
                                 p_data out REF_CUR) 
  as 
  begin 
      open p_data for 
        select a.entity_id VALUE_MEMBER, 
               A.f_name 
               || ' ' 
               || A.l_name DISP_OPTION 
          from emp_mas a 
         where exists (select distinct b.entity_type_id 
                         from entity_type_mas b 
                        where b.entity_type_name = 'TEACHER' 
                          and B.is_active = nvl(flg, b.is_active)) 
         order by 2; 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in fetching Teacher List'); 
  end; 
  procedure prc_get_batch_list(flg    varchar, 
                               p_data out REF_CUR) 
  as 
  begin 
      open p_data for 
        select a.batch_id   VALUE_MEM, 
               a.batch_name DISP_MEM 
          from batch_mas a 
         where a.is_active = nvl(flg, a.is_active); 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in fetching Teacher List'); 
  end; 
  procedure prc_get_entity_type(flg    varchar, 
                                p_data out REF_CUR) 
  as 
  begin 
      open p_data for 
        select a.entity_type_id   VALUE_MEM, 
               a.entity_type_name DISP_MEM 
          from entity_type_mas a 
         where a.is_active = nvl(flg, a.is_active); 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in fetching Teacher List'); 
  end; 
  procedure prc_get_static_combo(p_static_flg varchar2, 
                                 p_data       out REF_CUR) 
  as 
  begin 
      open p_data for 
        select a.* 
          from static_combo a 
         where a.ref_srno = (select srno 
                               from static_combo B 
                              where B.disp_mem = nvl(p_static_flg, b.disp_mem)); 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in fetching static combo data'); 
  end; 
  procedure prc_get_exam_list(p_exam_flg varchar2, 
                              p_data     out REF_CUR) 
  as 
  begin 
      open p_data for 
        select exam_id 
          from exam_mas 
         where exam_date < trunc(sysdate); 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in fetching static combo data'); 
  end; 
  procedure prc_get_emp_list(p_entity_type varchar2, 
                             p_is_active   varchar2, 
                             p_data        out REF_CUR) 
  as 
  begin 
      open p_data for 
        select entity_id, 
               entity_name, 
               entity_type_id 
          from entity_mas 
         where entity_type_id = nvl(p_entity_type, entity_type_id) 
           and is_active = nvl(p_is_active, is_active); 
  exception 
    when others then 
               raise_application_error(-20001, 
               'Problem in fetching static combo data'); 
  end; 
  function fun_get_data_err 
  return varchar2 
  as 
  begin 
      return 'Problem in getting data'; 
  end; 
  function fun_get_save_msg 
  return varchar2 
  as 
  begin 
      return 'Saved Successful'; 
  end; 
  function fun_get_update_msg 
  return varchar2 
  as 
  begin 
      return 'Updation Successful'; 
  end; 
  function fun_get_delete_msg 
  return varchar2 
  as 
  begin 
      return 'Deletion Successful'; 
  end; 
  function fun_get_save_err 
  return varchar2 
  as 
  begin 
      return 'Problem in insertion'; 
  end; 
  function fun_get_update_err 
  return varchar2 
  as 
  begin 
      return 'Problem in Updation'; 
  end; 
  function fun_get_delete_err 
  return varchar2 
  as 
  begin 
      return 'Problem in deletion'; 
  end; 
  function fun_get_timestamp_err 
  return varchar2 
  as 
  begin 
      return 'Data already updated some other user.\nRefresh Once'; 
  end; 
end pkg_tuition_base;

/
