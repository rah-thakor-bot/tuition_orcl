--------------------------------------------------------
--  DDL for Package PKG_SUB_ALLOCATION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_SUB_ALLOCATION" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_branch         sub_allocation.branch%type, 
    p_allocation_id  out sub_allocation.allocation_id%type, 
    p_batch_id       sub_allocation.batch_id%type, 
    p_entity_id      sub_allocation.entity_id%type, 
    p_entity_type_id sub_allocation.entity_type_id%type, 
    p_ref_sub_id     sub_allocation.ref_sub_id%type, 
    p_is_active      sub_allocation.is_active%type, 
    p_remark         sub_allocation.remark%type, 
    p_ent_term       sub_allocation.ent_term%type, 
    p_ent_user       sub_allocation.ent_user%type, 
    p_time_stamp     out sub_allocation.time_stamp%type, 
    p_flg            out varchar2, 
    p_msg            out varchar2 ); 
  --------------------------------------- 
  procedure prc_mas_upd( 
    p_branch         sub_allocation.branch%type, 
    p_allocation_id  sub_allocation.allocation_id%type, 
    p_batch_id       sub_allocation.batch_id%type, 
    p_entity_id      sub_allocation.entity_id%type, 
    p_entity_type_id sub_allocation.entity_type_id%type, 
    p_ref_sub_id     sub_allocation.ref_sub_id%type, 
    p_is_active      sub_allocation.is_active%type, 
    p_remark         sub_allocation.remark%type, 
    p_upd_term       sub_allocation.ent_term%type, 
    p_upd_user       sub_allocation.ent_user%type, 
    p_time_stamp     in out sub_allocation.time_stamp%type, 
    p_flg            out varchar2, 
    p_msg            out varchar2 ); 
  --------------------------------------------------- 
  procedure prc_mas_del( 
    p_allocation_id sub_allocation.allocation_id%type, 
    p_flg           out varchar2, 
    p_msg           out varchar2 ); 
  --------------------------------------------------- 
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
end pkg_sub_allocation;

/
