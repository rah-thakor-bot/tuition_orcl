--------------------------------------------------------
--  DDL for Package Body PKG_BATCH_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_BATCH_MAS" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_branch          batch_mas.branch%type, 
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
                        p_msg             out varchar2) 
  as 
  begin 
      select max(nvl(batch_id, 0)) + 1 
      into   p_batch_id 
      from   batch_mas; 

      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      begin 
          insert into batch_mas 
                      (branch, 
                       batch_id, 
                       batch_name, 
                       ref_sub_id, 
                       ref_t_entity_id, 
                       fr_time, 
                       to_time, 
                       ent_date, 
                       ent_user, 
                       ent_term, 
                       time_stamp, 
                       is_active) 
          values      (p_branch, 
                       p_batch_id, 
                       p_batch_name, 
                       p_ref_sub_id, 
                       p_ref_t_entity_id, 
                       p_fr_time, 
                       p_to_time, 
                       v_sysdate, 
                       p_ent_user, 
                       p_ent_term, 
                       v_timestamp, 
                       p_is_active ); 

          if sql%rowcount > 0 then 
            p_flg := 'Y'; 

            p_time_stamp := v_timestamp; 

            p_msg := pkg_tuition_base.fun_get_save_msg(); 

            return; 
          else 
            p_flg := 'N'; 

            p_msg := pkg_tuition_base.fun_get_save_err(); 
          end if; 
      exception 
          when others then 
            raise_application_error(-22011, sqlerrm); 
      end; 
  end; 
  --------------------- 
  procedure prc_mas_upd(p_branch          batch_mas.branch%type, 
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
                        p_msg             out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      update batch_mas 
      set    batch_name = p_batch_name, 
             ref_sub_id = p_ref_sub_id, 
             ref_t_entity_id = p_ref_t_entity_id, 
             fr_time = p_fr_time, 
             to_time = p_to_time, 
             is_active = p_is_active, 
             upd_date = v_sysdate, 
             upd_user = p_upd_user, 
             upd_term = p_upd_term, 
             time_stamp = v_timestamp 
      where  branch = p_branch 
         and batch_id = p_batch_id 
         and time_stamp = p_time_stamp; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_time_stamp := v_timestamp; 

        p_msg := pkg_tuition_base.fun_get_update_msg(); 

        return; 
      else 
        select count(1) 
        into   v_cnt 
        from   batch_mas a 
        where  a.branch = p_branch 
           and batch_id = p_batch_id 
           and a.time_stamp = p_time_stamp; 

        if v_cnt = 0 then 
          p_flg := 'T'; 

          p_msg := pkg_tuition_base.fun_get_timestamp_err(); 

          return; 
        else 
          p_flg := 'N'; 

          p_msg := pkg_tuition_base.fun_get_update_err(); 

          return; 
        end if; 
      end if; 
  exception 
    when others then 
               raise_application_error(-22011, sqlerrm); 
  end; 
  --------------------------------------- 
  procedure prc_mas_del(p_batch_id batch_mas.batch_id%type, 
                        p_flg      out varchar2, 
                        p_msg      out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from batch_mas a 
      where  a.batch_id = p_batch_id; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := pkg_tuition_base.fun_get_delete_msg(); 
      else 
        p_flg := 'N'; 

        p_msg := pkg_tuition_base.fun_get_delete_err(); 

        return; 
      end if; 
  exception 
    when others then 
               raise_application_error(-22011, sqlerrm); 
  end prc_mas_del; 
  --------------------------------------------------- 
  procedure prc_mas_get_data(p_criteria varchar2, 
                             p_data     out REF_CUR) 
  as 
    v_str varchar2(1000); 
  begin 
      v_str := 'SELECT BRANCH,                     
                       BATCH_ID,
                       BATCH_NAME,
                       REF_SUB_ID,
                       REF_T_ENTITY_ID,                     
                       FR_TIME,                     
                       TO_TIME,                     
                       TIME_STAMP              
                from   batch_mas a              
                where  1 = 1                     
                  and ' ||p_criteria; 
open p_data for v_str; 
exception 
  when others then 
             raise_application_error(-20010, 'Problem in fetching batch data'); 
end; 
end pkg_batch_mas;

/
