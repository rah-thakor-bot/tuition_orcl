--------------------------------------------------------
--  DDL for Package Body PKG_MONEY_FLOW
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_MONEY_FLOW" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_branch         money_flow.branch%type, 
                        p_trn_id         out money_flow.trn_id%type, 
                        p_trn_type       money_flow.trn_type%type, 
                        p_from_type      money_flow.from_type%type, 
                        p_from_entity_id money_flow.from_entity_id%type, 
                        p_to_type        money_flow.to_type%type, 
                        p_to_entity_id   money_flow.to_entity_id%type, 
                        p_amt            money_flow.amt%type, 
                        p_t_date         money_flow.t_date%type, 
                        p_concern_prsn   money_flow.concern_prsn%type, 
                        p_ent_term       money_flow.ent_term%type, 
                        p_ent_user       money_flow.ent_user%type, 
                        p_time_stamp     out money_flow.time_stamp%type, 
                        p_flg            out varchar2, 
                        p_msg            out varchar2) 
  as 
  begin 
      begin 
          select nvl(max(trn_id), 0) + 1 
            into p_trn_id 
            from money_flow; 

          v_sysdate := sysdate; 

          v_timestamp := to_char(systimestamp); 

          insert into money_flow 
                      (branch, 
                       trn_id, 
                       trn_type, 
                       from_type, 
                       from_entity_id, 
                       to_type, 
                       to_entity_id, 
                       amt, 
                       t_date, 
                       concern_prsn, 
                       ent_date, 
                       ent_term, 
                       ent_user, 
                       time_stamp) 
               values (p_branch, 
                       p_trn_id, 
                       p_trn_type, 
                       p_from_type, 
                       p_from_entity_id, 
                       p_to_type, 
                       p_to_entity_id, 
                       p_amt, 
                       p_t_date, 
                       p_concern_prsn, 
                       v_sysdate, 
                       p_ent_term, 
                       p_ent_user, 
                       v_timestamp); 

          if sql%rowcount > 0 then 
            p_flg := 'Y'; 

            p_msg := pkg_tuition_base.fun_get_save_msg(); 

            p_time_stamp := v_timestamp; 

            return; 
          else 
            p_flg := 'N'; 

            p_msg := pkg_tuition_base.fun_get_save_err(); 
          end if; 
      exception 
          when dup_val_on_index then 
            p_flg := 'N'; 

            p_msg := 'Already Exist!'; 
          when others then 
            raise_application_error(-22011, sqlerrm); 
      end; 
  end; 
  --------------------- 
  procedure prc_mas_upd(p_branch         money_flow.branch%type, 
                        p_trn_id         money_flow.trn_id%type, 
                        p_trn_type       money_flow.trn_type%type, 
                        p_from_type      money_flow.from_type%type, 
                        p_from_entity_id money_flow.from_entity_id%type, 
                        p_to_type        money_flow.to_type%type, 
                        p_to_entity_id   money_flow.to_entity_id%type, 
                        p_amt            money_flow.amt%type, 
                        p_t_date         money_flow.t_date%type, 
                        p_concern_prsn   money_flow.concern_prsn%type, 
                        p_upd_term       money_flow.upd_term%type, 
                        p_upd_user       money_flow.upd_user%type, 
                        p_time_stamp     in out money_flow.time_stamp%type, 
                        p_flg            out varchar2, 
                        p_msg            out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      update money_flow 
         set branch = p_branch, 
             trn_type = p_trn_type, 
             from_type = p_from_type, 
             from_entity_id = p_from_entity_id, 
             to_type = p_to_type, 
             to_entity_id = p_to_entity_id, 
             amt = p_amt, 
             t_date = p_t_date, 
             concern_prsn = p_concern_prsn, 
             upd_date = v_sysdate, 
             upd_user = p_upd_user, 
             upd_term = p_upd_term, 
             time_stamp = v_timestamp 
       where trn_id = p_trn_id 
         and time_stamp = v_timestamp; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := pkg_tuition_base.fun_get_update_msg(); 

        return; 
      else 
        select count(*) 
          into v_cnt 
          from money_flow a 
         where trn_id = p_trn_id 
           and time_stamp = v_timestamp; 

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
  procedure prc_mas_del(p_branch money_flow.branch%type, 
                        p_trn_id money_flow.trn_id%type, 
                        p_flg    out varchar2, 
                        p_msg    out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from money_flow a 
       where branch = p_branch 
         and trn_id = p_trn_id; 

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
    v_str varchar2(3000); 
  begin 
      v_str := 'SELECT BRANCH, TRN_ID, TRN_TYPE, FROM_TYPE, FROM_ENTITY_ID, TO_TYPE, TO_ENTITY_ID, AMT, T_DATE, CONCERN_PRSN, TIME_STAMP FROM MONEY_FLOW a WHERE 1 = 1 AND ' 
               ||p_criteria; 

      open p_data for v_str; 
  exception 
    when others then 
               raise_application_error(-20010, 'Problem in fetching batch data'); 
  end; 
end pkg_money_flow;

/
