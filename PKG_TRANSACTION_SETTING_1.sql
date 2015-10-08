--------------------------------------------------------
--  DDL for Package Body PKG_TRANSACTION_SETTING
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_TRANSACTION_SETTING" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_batch_id           transaction_setting.batch_id%type, 
                        p_seqno              out transaction_setting.seqno%type, 
                        p_ref_entity_type_id transaction_setting.ref_entity_type_id%type, 
                        p_amount             transaction_setting.amount%type, 
                        p_cash_chq_ratio     transaction_setting.cash_chq_ratio%type, 
                        p_allow_emi          transaction_setting.allow_emi%type, 
                        p_allow_advance      transaction_setting.allow_advance%type, 
                        p_no_of_emi          transaction_setting.no_of_emi%type, 
                        p_discount           transaction_setting.discount%type, 
                        p_remark             transaction_setting.remark%type, 
                        p_ent_term           transaction_setting.ent_term%type, 
                        p_ent_user           transaction_setting.ent_user%type, 
                        p_time_stamp         out transaction_setting.time_stamp%type, 
                        p_flg                out varchar2, 
                        p_msg                out varchar2) 
  as 
  begin 
      begin 
          select nvl(max(seqno), 0) + 1 
            into p_seqno 
            from transaction_setting; 

          insert into transaction_setting 
                      (batch_id, 
                       ref_entity_type_id, 
                       amount, 
                       cash_chq_ratio, 
                       allow_emi, 
                       allow_advance, 
                       no_of_emi, 
                       discount, 
                       remark, 
                       ent_date, 
                       ent_term, 
                       ent_user, 
                       time_stamp, 
                       seqno) 
               values (p_batch_id, 
                       p_ref_entity_type_id, 
                       p_amount, 
                       p_cash_chq_ratio, 
                       p_allow_emi, 
                       p_allow_advance, 
                       p_no_of_emi, 
                       p_discount, 
                       p_remark, 
                       sysdate, 
                       p_ent_term, 
                       p_ent_user, 
                       systimestamp, 
                       p_seqno ); 

          if sql%rowcount > 0 then 
            p_flg := 'Y'; 

            p_time_stamp := systimestamp; 

            p_msg := sql%rowcount 
                     ||' record(s) successfully saved!'; 

            return; 
          else 
            p_flg := 'N'; 

            p_msg := 'Problem in inserting record!'; 
          end if; 
      exception 
          when dup_val_on_index then 
            p_flg := 'N'; 

            p_msg := 'Already Exist!'; 
          when others then 
            raise_application_error(-20001, 'Problem in inserting record ' 
                                            ||sqlerrm); 
      end; 
  end prc_mas_ins; 
  procedure prc_mas_upd(p_batch_id           transaction_setting.batch_id%type, 
                        p_seqno              transaction_setting.seqno%type, 
                        p_ref_entity_type_id transaction_setting.ref_entity_type_id%type, 
                        p_amount             transaction_setting.amount%type, 
                        p_cash_chq_ratio     transaction_setting.cash_chq_ratio%type, 
                        p_allow_emi          transaction_setting.allow_emi%type, 
                        p_allow_advance      transaction_setting.allow_advance%type, 
                        p_no_of_emi          transaction_setting.no_of_emi%type, 
                        p_discount           transaction_setting.discount%type, 
                        p_remark             transaction_setting.remark%type, 
                        p_upd_term           transaction_setting.upd_term%type, 
                        p_upd_user           transaction_setting.upd_user%type, 
                        p_time_stamp         in out transaction_setting.time_stamp%type, 
                        p_flg                out varchar2, 
                        p_msg                out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      update transaction_setting 
         set batch_id = p_batch_id, 
             ref_entity_type_id = p_ref_entity_type_id, 
             amount = p_amount, 
             cash_chq_ratio = p_cash_chq_ratio, 
             allow_emi = p_allow_emi, 
             allow_advance = p_allow_advance, 
             no_of_emi = p_no_of_emi, 
             discount = p_discount, 
             remark = p_remark, 
             upd_date = sysdate, 
             upd_user = p_upd_user, 
             upd_term = p_upd_term, 
             time_stamp = systimestamp 
       where seqno = p_seqno /*unique id*/; 

      /*and time_stamp = p_time_stamp;*/ 
      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := sql%rowcount 
                 || ' record(s) updated successfully!'; 

        return; 
      else 
        select count(1) 
          into v_cnt 
          from transaction_setting a 
         where a.seqno = p_seqno /*unique id*/; 

        /*and a.time_stamp = p_time_stamp;*/ 
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
  end prc_mas_upd; 
  procedure prc_mas_del(p_seqno transaction_setting.seqno%type, 
                        p_flg   out varchar2, 
                        p_msg   out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from transaction_setting a 
       where a.seqno = p_seqno /*unique id*/; 

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
      v_str := 'SELECT BATCH_ID, SEQNO, REF_ENTITY_TYPE_ID, AMOUNT, CASH_CHQ_RATIO, ALLOW_EMI, ALLOW_ADVANCE, NO_OF_EMI, DISCOUNT, REMARK, TIME_STAMP FROM TRANSACTION_SETTING a WHERE 1 = 1 AND ' 
               ||p_criteria; 

      open p_data for v_str; 
  end; 
end pkg_transaction_setting;

/
