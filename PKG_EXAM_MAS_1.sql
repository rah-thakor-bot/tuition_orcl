--------------------------------------------------------
--  DDL for Package Body PKG_EXAM_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_EXAM_MAS" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_branch       exam_mas.branch%type, 
                        p_batch_id     exam_mas.batch_id%type, 
                        p_exam_id      out exam_mas.exam_id %type, 
                        p_ref_sub_id   exam_mas.ref_sub_id%type, 
                        p_total_mark   exam_mas.total_mark%type, 
                        p_exam_type    exam_mas.exam_type%type, 
                        p_type_det     exam_mas.type_det%type, 
                        p_paper_set_by exam_mas.paper_set_by%type, 
                        p_exam_date    exam_mas.exam_date%type, 
                        p_exam_time    exam_mas.exam_time%type, 
                        p_duration     exam_mas.duration%type, 
                        p_supervisor   exam_mas.supervisor%type, 
                        p_ent_term     exam_mas.ent_term%type, 
                        p_ent_user     exam_mas.ent_user%type, 
                        p_time_stamp   out exam_mas.time_stamp%type, 
                        p_flg          out varchar2, 
                        p_msg          out varchar2) 
  as 
  begin 
      begin 
          select nvl(max(exam_id), 0) + 1 
            into p_exam_id 
            from exam_mas; 

          v_sysdate := sysdate; 

          v_timestamp := to_char(systimestamp); 

          insert into exam_mas 
                      (branch, 
                       batch_id, 
                       exam_id, 
                       ref_sub_id, 
                       total_mark, 
                       exam_type, 
                       type_det, 
                       paper_set_by, 
                       exam_date, 
                       exam_time, 
                       duration, 
                       supervisor, 
                       ent_date, 
                       ent_term, 
                       ent_user, 
                       time_stamp) 
               values (p_branch, 
                       p_batch_id, 
                       p_exam_id, 
                       p_ref_sub_id, 
                       p_total_mark, 
                       p_exam_type, 
                       p_type_det, 
                       p_paper_set_by, 
                       p_exam_date, 
                       p_exam_time, 
                       p_duration, 
                       p_supervisor, 
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
  procedure prc_mas_upd(p_branch       exam_mas.branch%type, 
                        p_batch_id     exam_mas.batch_id%type, 
                        p_exam_id      exam_mas.exam_id %type, 
                        p_ref_sub_id   exam_mas.ref_sub_id%type, 
                        p_total_mark   exam_mas.total_mark%type, 
                        p_exam_type    exam_mas.exam_type%type, 
                        p_type_det     exam_mas.type_det%type, 
                        p_paper_set_by exam_mas.paper_set_by%type, 
                        p_exam_date    exam_mas.exam_date%type, 
                        p_exam_time    exam_mas.exam_time%type, 
                        p_duration     exam_mas.duration%type, 
                        p_supervisor   exam_mas.supervisor%type, 
                        p_upd_term     exam_mas.ent_term%type, 
                        p_upd_user     exam_mas.ent_user%type, 
                        p_time_stamp   in out exam_mas.time_stamp%type, 
                        p_flg          out varchar2, 
                        p_msg          out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      update exam_mas a 
         set a.branch = p_branch, 
             a.batch_id = p_batch_id, 
             a.ref_sub_id = p_ref_sub_id, 
             a.total_mark = p_total_mark, 
             a.exam_type = p_exam_type, 
             a.type_det = p_type_det, 
             a.paper_set_by = p_paper_set_by, 
             a.exam_date = p_exam_date, 
             a.exam_time = p_exam_time, 
             a.duration = p_duration, 
             a.supervisor = p_supervisor, 
             a.upd_date = v_sysdate, 
             a.upd_user = p_upd_user, 
             a.upd_term = p_upd_term, 
             a.time_stamp = v_timestamp 
       where a.exam_id = p_exam_id 
         and a.time_stamp = p_time_stamp; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := pkg_tuition_base.fun_get_update_msg(); 

        return; 
      else 
        select count(*) 
          into v_cnt 
          from exam_mas a 
         where exam_id = p_exam_id 
           and time_stamp = p_time_stamp; 

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
  procedure prc_mas_del(p_exam_id exam_mas.exam_id%type, 
                        p_flg     out varchar2, 
                        p_msg     out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from exam_mas a 
       where exam_id = p_exam_id; 

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
      v_str := 'SELECT a.BRANCH, a.EXAM_ID, a.BATCH_ID, a.REF_SUB_ID, a.TOTAL_MARK, a.EXAM_TYPE, a.TYPE_DET, a.PAPER_SET_BY, a.EXAM_DATE, a.EXAM_TIME, a.DURATION, a.SUPERVISOR, a.TIME_STAMP TIMESTAMP FROM EXAM_MAS a where 1 = 1 and ' 
               ||p_criteria; 

      open p_data for v_str; 
  exception 
    when others then 
               raise_application_error(-20010, 'Problem in fetching batch data') 
               ; 
  end; 
end pkg_exam_mas;

/
