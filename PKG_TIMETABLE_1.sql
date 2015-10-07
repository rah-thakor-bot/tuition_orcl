--------------------------------------------------------
--  DDL for Package Body PKG_TIMETABLE
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_TIMETABLE" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_branch_id       timetable.branch%type, 
                        p_batch_id        timetable.batch_id%type, 
                        p_t_date          timetable.t_date%type, 
                        p_fr_time         timetable.fr_time%type, 
                        p_to_time         timetable.to_time%type, 
                        p_ref_sub_id      timetable.ref_sub_id%type, 
                        p_ref_t_entity_id timetable.ref_t_entity_id%type, 
                        p_ent_term        timetable.ent_term%type, 
                        p_ent_user        timetable.ent_user%type, 
                        p_time_stamp      out timetable.time_stamp%type, 
                        p_flg             out varchar2, 
                        p_msg             out varchar2) 
  as 
  begin 
      begin 
          insert into timetable 
                      (branch, 
                       batch_id, 
                       t_date, 
                       fr_time, 
                       to_time, 
                       ref_sub_id, 
                       ref_t_entity_id, 
                       ent_date, 
                       ent_term, 
                       ent_user, 
                       time_stamp) 
               values (p_branch_id, 
                       p_batch_id, 
                       p_t_date, 
                       p_fr_time, 
                       p_to_time, 
                       p_ref_sub_id, 
                       p_ref_t_entity_id, 
                       sysdate, 
                       p_ent_term, 
                       p_ent_user, 
                       systimestamp ); 

          if sql%rowcount > 0 then 
            p_flg := 'Y'; 

            p_msg := sql%rowcount 
                     ||' record(s) successfully saved!'; 

            /*p_time_stamp := systimestamp;*/ 
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
  --------------------- 
  procedure prc_mas_upd(p_branch          timetable.branch%type, 
                        p_batch_id        timetable.batch_id%type, 
                        p_t_date          timetable.t_date%type, 
                        p_fr_time         timetable.fr_time%type, 
                        p_to_time         timetable.to_time%type, 
                        p_ref_sub_id      timetable.ref_sub_id%type, 
                        p_ref_t_entity_id timetable.ref_t_entity_id%type, 
                        p_upd_term        timetable.ent_term%type, 
                        p_upd_user        timetable.ent_user%type, 
                        p_time_stamp      in out timetable.time_stamp%type, 
                        p_flg             out varchar2, 
                        p_msg             out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      update timetable 
         set batch_id = p_batch_id, 
             t_date = p_t_date, 
             fr_time = p_fr_time, 
             to_time = p_to_time, 
             ref_sub_id = p_ref_sub_id, 
             ref_t_entity_id = p_ref_t_entity_id, 
             upd_date = sysdate, 
             upd_user = p_upd_user, 
             upd_term = p_upd_term, 
             time_stamp = systimestamp 
       where branch = p_branch; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := sql%rowcount 
                 || ' record(s) updated successfully!'; 

        return; 
      else 
        select count(1) 
          into v_cnt 
          from timetable a 
         where branch = p_branch; 

        /*and time_stamp = p_time_stamp;*/ 
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
  --------------------------------------- 
  procedure prc_mas_del(p_uniqid timetable.batch_id%type, 
                        p_flg    out varchar2, 
                        p_msg    out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from timetable a 
       where 1 = p_uniqid; 

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
      v_str := 'SELECT BRANCH, BATCH_ID, T_DATE, FR_TIME, TO_TIME, REF_SUB_ID, REF_T_ENTITY_ID, TIME_STAMP FROM TIMETABLE a WHERE 1 = 1 AND ' 
               ||p_criteria; 

      open p_data for v_str; 
  end; 
end pkg_timetable;

/
