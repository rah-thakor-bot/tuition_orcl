--------------------------------------------------------
--  DDL for Package Body PKG_STUDY_LEVEL_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_STUDY_LEVEL_MAS" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_branch_id  study_level_mas.branch%type, 
                        p_std_id     out study_level_mas.std_id%type, 
                        p_std_level  study_level_mas.std_level%type, 
                        p_std_med    study_level_mas.std_medium%type, 
                        p_std_type   study_level_mas.std_type%type, 
                        p_std_name   study_level_mas.std_name%type, 
                        p_is_active  study_level_mas.is_active%type, 
                        p_ent_user   study_level_mas.ent_user%type, 
                        p_ent_term   study_level_mas.ent_term%type, 
                        p_time_stamp in out study_level_mas.time_stamp%type, 
                        p_flg        out varchar2, 
                        p_msg        out varchar2) 
  as 
  begin 
      select nvl(max(std_id), 0) + 1 
        into p_std_id 
        from study_level_mas; 

      -- TODO: Implementation required for procedure PKG_STUDY_LEVEL_MAS.prc_mas_ins 
      begin 
          insert into study_level_mas 
                      (branch, 
                       std_id, 
                       std_level, 
                       std_medium, 
                       std_type, 
                       std_name, 
                       is_active, 
                       ent_date, 
                       ent_user, 
                       ent_term, 
                       time_stamp) 
               values (p_branch_id, 
                       p_std_id, 
                       p_std_level, 
                       p_std_med, 
                       p_std_type, 
                       p_std_name, 
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
  end prc_mas_ins; 
  procedure prc_mas_upd(p_branch_id  study_level_mas.branch%type, 
                        p_std_id     study_level_mas.std_id%type, 
                        p_std_level  study_level_mas.std_level%type, 
                        p_std_med    study_level_mas.std_medium%type, 
                        p_std_type   study_level_mas.std_type%type, 
                        p_std_name   study_level_mas.std_name%type, 
                        p_is_active  study_level_mas.is_active%type, 
                        p_upd_user   study_level_mas.upd_user%type, 
                        p_upd_term   study_level_mas.upd_term%type, 
                        p_time_stamp in out study_level_mas.time_stamp%type, 
                        p_flg        out varchar2, 
                        p_msg        out varchar2) 
  as 
    v_cnt number(2); 
  begin 
      -- TODO: Implementation required for procedure PKG_STUDY_LEVEL_MAS.prc_mas_upd 
      update study_level_mas 
         set branch = p_branch_id, 
             std_level = p_std_level, 
             std_medium = p_std_med, 
             std_type = p_std_type, 
             std_name = p_std_name, 
             is_active = p_is_active, 
             upd_date = sysdate, 
             upd_user = p_upd_user, 
             upd_term = p_upd_term 
       --TIME_STAMP  = SYSTIMESTAMP 
       where branch = p_branch_id 
         and std_id = p_std_id; 

      --and TIME_STAMP = p_time_stamp; 
      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := sql%rowcount 
                 || ' record(s) updated successfully!'; 

        return; 
      else 
        select count(1) 
          into v_cnt 
          from study_level_mas a 
         where a.branch = p_branch_id 
           and a.std_id = p_std_id; 

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
  end prc_mas_upd; 
  procedure prc_mas_del(p_branch_id study_level_mas.branch%type, 
                        p_std_id    study_level_mas.std_id%type, 
                        p_flg       out varchar2, 
                        p_msg       out varchar2) 
  as 
  begin 
      -- TODO: Implementation required for procedure PKG_STUDY_LEVEL_MAS.prc_mas_del 
      delete from study_level_mas a 
       where a.branch = p_branch_id 
         and a.std_id = p_std_id; 

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
  procedure prc_get_data(p_criteria varchar2, 
                         p_data     out REF_CUR) 
  as 
    v_str varchar2(1000); 
  begin 
      v_str := 'select a.BRANCH, a.STD_ID, a.STD_MEDIUM, a.STD_LEVEL, a.STD_TYPE, a.STD_NAME, a.IS_ACTIVE, a.TIME_STAMP from   STUDY_LEVEL_MAS a where  ' 
               ||p_criteria 
               ||' order by A.STD_ID'; 

      open p_data for v_str; 
  end; 
end pkg_study_level_mas;

/
