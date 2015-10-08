--------------------------------------------------------
--  DDL for Package Body PKG_SUB_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_SUB_MAS" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_branch     sub_mas.branch%type, 
                        p_ref_std_id sub_mas.ref_std_id%type, 
                        p_sub_id     out sub_mas.sub_id%type, 
                        p_sub_name   sub_mas.sub_name%type, 
                        p_have_exam  sub_mas.have_exam%type, 
                        p_is_active  sub_mas.is_active%type, 
                        p_ent_user   sub_mas.ent_user%type, 
                        p_ent_term   sub_mas.ent_term%type, 
                        p_time_stamp out sub_mas.time_stamp%type, 
                        p_flg        out varchar2, 
                        p_msg        out varchar2) 
  as 
  begin 
      begin 
          select nvl(max(sub_id), 0) + 1 
            into p_sub_id 
            from sub_mas; 

          insert into sub_mas 
                      (branch, 
                       ref_std_id, 
                       sub_id, 
                       sub_name, 
                       have_exam, 
                       is_active, 
                       ent_date, 
                       ent_user, 
                       ent_term, 
                       time_stamp) 
               values (p_branch, 
                       p_ref_std_id, 
                       p_sub_id, 
                       p_sub_name, 
                       p_have_exam, 
                       p_is_active, 
                       sysdate, 
                       p_ent_user, 
                       p_ent_term, 
                       systimestamp ); 

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
  procedure prc_mas_upd(p_branch     sub_mas.branch%type, 
                        p_ref_std_id sub_mas.ref_std_id%type, 
                        p_sub_id     sub_mas.sub_id%type, 
                        p_sub_name   sub_mas.sub_name%type, 
                        p_have_exam  sub_mas.have_exam%type, 
                        p_is_active  sub_mas.is_active%type, 
                        p_upd_term   sub_mas.ent_term%type, 
                        p_upd_user   sub_mas.ent_user%type, 
                        p_time_stamp in out sub_mas.time_stamp%type, 
                        p_flg        out varchar2, 
                        p_msg        out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      update sub_mas 
         set ref_std_id = p_ref_std_id, 
             sub_name = p_sub_name, 
             have_exam = p_have_exam, 
             is_active = p_is_active, 
             upd_date = sysdate, 
             upd_user = p_upd_user, 
             upd_term = p_upd_term, 
             time_stamp = systimestamp 
       where branch = p_branch 
         and sub_id = p_sub_id; 

      --and time_stamp = p_time_stamp; 
      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := sql%rowcount 
                 || ' record(s) updated successfully!'; 

        return; 
      else 
        select count(1) 
          into v_cnt 
          from sub_mas a 
         where a.branch = p_branch 
           and sub_id = p_sub_id; 

        --and a.time_stamp = p_time_stamp; 
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
  procedure prc_mas_del(p_branch sub_mas.branch%type, 
                        p_sub_id sub_mas.sub_id%type, 
                        p_flg    out varchar2, 
                        p_msg    out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from sub_mas a 
       where a.branch = p_branch 
         and a.sub_id = p_sub_id; 

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
                             p_sub_data out REF_CUR, 
                             p_chp_data out REF_CUR) 
  as 
    v_str varchar2(4000); 
  begin 
      v_str := 'select BRANCH, SUB_ID, REF_STD_ID, SUB_NAME, HAVE_EXAM, IS_ACTIVE, TIME_STAMP from   sub_mas a where  1 = 1 and ' 
               ||p_criteria; 

      open p_sub_data for v_str; 

      v_str := 'select SEQNO, REF_SUB_ID, CHP_ID, CHP_NAME, DESCRIPTION, REMARK, TIME_STAMP from chp_det c where ref_sub_id in (select sub_id from sub_mas where ' 
               || p_criteria 
               || '  ) order by chp_id'; 

      open p_chp_data for v_str; 
  end; 
end pkg_sub_mas;

/
