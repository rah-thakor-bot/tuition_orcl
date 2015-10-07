--------------------------------------------------------
--  DDL for Package Body PKG_SUB_ALLOCATION
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_SUB_ALLOCATION" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_branch         sub_allocation.branch%type, 
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
                        p_msg            out varchar2) 
  as 
  begin 
      begin 
          select nvl(max(allocation_id), 0) + 1 
            into p_allocation_id 
            from sub_allocation; 

          insert into sub_allocation 
                      (branch, 
                       batch_id, 
                       entity_id, 
                       entity_type_id, 
                       ref_sub_id, 
                       is_active, 
                       remark, 
                       ent_date, 
                       ent_term, 
                       ent_user, 
                       time_stamp, 
                       allocation_id) 
               values (p_branch, 
                       p_batch_id, 
                       p_entity_id, 
                       p_entity_type_id, 
                       p_ref_sub_id, 
                       p_is_active, 
                       p_remark, 
                       sysdate, 
                       p_ent_term, 
                       p_ent_user, 
                       systimestamp, 
                       p_allocation_id ); 

          if sql%rowcount > 0 then 
            p_flg := 'Y'; 

            p_msg := sql%rowcount 
                     ||' record(s) successfully saved!'; 

            --p_time_stamp := systimestamp; 
            return; 
          else 
            p_flg := 'N'; 

            p_msg := 'Problem in inserting record!'; 
          end if; 
      exception 
          when dup_val_on_index then 
            p_flg := 'N'; 

            p_msg := 'Already Exist!'; 
      end; 
  end; 
  --------------------------------------- 
  procedure prc_mas_upd(p_branch         sub_allocation.branch%type, 
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
                        p_msg            out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      update sub_allocation 
         set branch = p_branch, 
             batch_id = p_batch_id, 
             entity_id = p_entity_id, 
             entity_type_id = p_entity_type_id, 
             ref_sub_id = p_ref_sub_id, 
             is_active = p_is_active, 
             remark = p_remark, 
             upd_date = sysdate, 
             upd_user = p_upd_user, 
             upd_term = p_upd_term--, 
       --time_stamp = systimestamp 
       where allocation_id = p_allocation_id; 

      --and time_stamp = p_time_stamp; 
      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := sql%rowcount 
                 || ' record(s) updated successfully!'; 

        return; 
      else 
        select count(1) 
          into v_cnt 
          from sub_allocation a 
         where allocation_id = p_allocation_id 
           and a.time_stamp = p_time_stamp; 

        if v_cnt = 0 then 
          p_flg := 'T'; 

          p_msg := 'Please refresh once. As some contain change by another user!'; 

          return; 
        else 
          p_flg := 'N'; 

          p_msg := 'Problem in updating record!'; 

          return; 
        end if; 
      end if; 
  end; 
  --------------------------------------------------- 
  procedure prc_mas_del(p_allocation_id sub_allocation.allocation_id%type, 
                        p_flg           out varchar2, 
                        p_msg           out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from sub_allocation a 
       where allocation_id = p_allocation_id; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := sql%rowcount 
                 || ' record(s) deleted successfully!'; 
      else 
        p_flg := 'T'; 

        p_msg := 'Please refresh once. As some contain change by another user!'; 

        return; 
      end if; 
  end prc_mas_del; 
  --------------------------------------------------- 
  procedure prc_mas_get_data(p_criteria varchar2, 
                             p_data     out REF_CUR) 
  as 
    v_str varchar2(1000); 
  begin 
      v_str := 'SELECT BRANCH, ALLOCATION_ID, BATCH_ID, ENTITY_ID, ENTITY_TYPE_ID, REF_SUB_ID, IS_ACTIVE, REMARK, TIME_STAMP FROM SUB_ALLOCATION a where 1 = 1 and ' 
               ||p_criteria; 

      open p_data for v_str; 
  end; 
end pkg_sub_allocation;

/
