--------------------------------------------------------
--  DDL for Package Body PKG_CHP_DET
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_CHP_DET" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_ref_sub_id  chp_det.ref_sub_id%type, 
                        p_seqno       out chp_det.seqno%type, 
                        p_chp_id      chp_det.chp_id%type, 
                        p_chp_name    chp_det.chp_name%type, 
                        p_description chp_det.description%type, 
                        p_remark      chp_det.remark%type, 
                        p_ent_term    chp_det.ent_term%type, 
                        p_ent_user    chp_det.ent_user%type, 
                        p_time_stamp  out chp_det.time_stamp%type, 
                        p_flg         out varchar2, 
                        p_msg         out varchar2) 
  as 
  begin 
      select nvl(max(seqno), 0) + 1 
        into p_seqno 
        from chp_det; 

      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      begin 
          insert into chp_det 
                      (seqno, 
                       ref_sub_id, 
                       chp_id, 
                       chp_name, 
                       description, 
                       remark, 
                       ent_date, 
                       ent_term, 
                       ent_user, 
                       time_stamp) 
               values (p_seqno, 
                       p_ref_sub_id, 
                       p_chp_id, 
                       p_chp_name, 
                       p_description, 
                       p_remark, 
                       v_sysdate, 
                       p_ent_term, 
                       p_ent_user, 
                       v_timestamp); 

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
          when dup_val_on_index then 
            p_flg := 'N'; 

            p_msg := 'Already Exist!'; 
          when others then 
            raise_application_error(-22011, sqlerrm); 
      end; 
  end; 
  --------------------------------------- 
  procedure prc_mas_upd(p_ref_sub_id  chp_det.ref_sub_id%type, 
                        p_seqno       chp_det.seqno%type, 
                        p_chp_id      chp_det.chp_id%type, 
                        p_chp_name    chp_det.chp_name%type, 
                        p_description chp_det.description%type, 
                        p_remark      chp_det.remark%type, 
                        p_upd_term    chp_det.ent_term%type, 
                        p_upd_user    chp_det.ent_user%type, 
                        p_time_stamp  in out chp_det.time_stamp%type, 
                        p_flg         out varchar2, 
                        p_msg         out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      update chp_det a 
         set a.ref_sub_id = p_ref_sub_id, 
             a.chp_id = p_chp_id, 
             a.chp_name = p_chp_name, 
             a.description = p_description, 
             a.remark = p_remark, 
             a.upd_date = v_sysdate, 
             a.upd_user = p_upd_user, 
             a.upd_term = p_upd_term, 
             a.time_stamp = v_timestamp 
       where a.seqno = p_seqno 
         and time_stamp = p_time_stamp; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_time_stamp := v_timestamp; 

        p_msg := pkg_tuition_base.fun_get_update_msg(); 

        return; 
      else 
        select count(*) 
          into v_cnt 
          from chp_det a 
         where a.seqno = p_seqno 
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
  --------------------------------------------------- 
  procedure prc_mas_del(p_seqno chp_det.seqno%type, 
                        p_flg   out varchar2, 
                        p_msg   out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from chp_det a 
       where a.seqno = p_seqno; 

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
      v_str := 'select * from   chp_det a where  1 = 1 and ' 
               ||p_criteria; 

      open p_data for v_str; 
  exception 
    when others then 
               raise_application_error(-20010, 'Problem in fetching batch data') 
               ; 
  end; 
end pkg_chp_det;

/
