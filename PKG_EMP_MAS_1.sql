--------------------------------------------------------
--  DDL for Package Body PKG_EMP_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_EMP_MAS" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_emp_ins(p_branch     emp_mas.branch%type, 
                        p_emp_type   varchar, 
                        /*p_gr_no out EMP_MAS.GR_NO%type,*/ 
                        p_f_name     emp_mas.f_name%type, 
                        p_m_name     emp_mas.m_name%type, 
                        p_l_name     emp_mas.l_name%type, 
                        p_dob        emp_mas.dob%type, 
                        p_doj        emp_mas.doj%type, 
                        p_leave_date emp_mas.leave_date%type, 
                        p_sex        emp_mas.sex%type, 
                        p_blood_grp  emp_mas.blood_grp%type, 
                        p_phone1     emp_mas.phone1%type, 
                        p_phone2     emp_mas.phone2%type, 
                        /*p_photo         EMP_MAS.PHOTO%type,*/ 
                        p_add1       emp_mas.add1%type, 
                        p_add2       emp_mas.add2%type, 
                        p_city       emp_mas.city%type, 
                        p_state      emp_mas.state%type, 
                        p_pincode    emp_mas.pincode%type, 
                        p_email_id   emp_mas.email_id%type, 
                        p_ent_user   emp_mas.ent_user%type, 
                        p_ent_term   emp_mas.ent_term%type, 
                        p_time_stamp out emp_mas.time_stamp%type, 
                        p_entity_id  out emp_mas.entity_id%type, 
                        p_flg        out varchar2, 
                        p_msg        out varchar2) 
  as 
    v_entity_type_id number; 
  begin 
      select seq_entity_id.nextval 
        into p_entity_id 
        from dual; 

      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      insert into emp_mas 
                  (branch, 
                   entity_id,/*GR_NO,*/ 
                   f_name, 
                   m_name, 
                   l_name, 
                   dob, 
                   doj, 
                   leave_date, 
                   sex, 
                   blood_grp, 
                   phone1, 
                   phone2,/*PHOTO,*/ 
                   add1, 
                   add2, 
                   city, 
                   state, 
                   pincode, 
                   email_id, 
                   ent_date, 
                   ent_user, 
                   ent_term, 
                   time_stamp) 
           values (p_branch, 
                   p_entity_id,/*p_gr_no,*/ 
                   p_f_name, 
                   p_m_name, 
                   p_l_name, 
                   p_dob, 
                   p_doj, 
                   p_leave_date, 
                   p_sex, 
                   p_blood_grp, 
                   p_phone1, 
                   p_phone2,/*p_photo,*/ 
                   p_add1, 
                   p_add2, 
                   p_city, 
                   p_state, 
                   p_pincode, 
                   p_email_id, 
                   v_sysdate, 
                   p_ent_user, 
                   p_ent_term, 
                   v_timestamp ); 

      if sql%rowcount > 0 then 
        begin 
            select entity_type_id 
              into v_entity_type_id 
              from entity_type_mas a 
             where a.entity_type_name = upper(p_emp_type); 
        exception 
            when no_data_found then 
              p_flg := 'N'; 

              p_msg := 'Type not found in type master'; 

              return; 
        end; insert into entity_mas ( entity_id, entity_type_id, entity_name, 
      is_active, ent_date, ent_user, ent_term, time_stamp ) values ( p_entity_id 
      , 
      v_entity_type_id, p_f_name, 'Y', v_sysdate, p_ent_user, p_ent_term, 
      v_timestamp 
      ); p_flg := 'Y'; p_msg := pkg_tuition_base.fun_get_save_msg(); 
      p_time_stamp 
      := 
      v_timestamp; return; 
      else 
        p_flg := 'N'; 

        p_msg := pkg_tuition_base.fun_get_save_err(); 
      end if; 
  exception 
    when dup_val_on_index then 
               p_flg := 'N'; 

               p_msg := 'Already Exist!'; when others then 
               p_flg := 'N'; 

               p_msg := pkg_tuition_base.fun_get_save_err(); 
  end prc_emp_ins; 
  --------------------------------------------------- 
  procedure prc_emp_upd(p_branch     emp_mas.branch%type, 
                        p_entity_id  emp_mas.entity_id%type, 
                        p_emp_type   varchar, 
                        /*p_gr_no       EMP_MAS.GR_NO%type,*/ 
                        p_f_name     emp_mas.f_name%type, 
                        p_m_name     emp_mas.m_name%type, 
                        p_l_name     emp_mas.l_name%type, 
                        p_dob        emp_mas.dob%type, 
                        p_doj        emp_mas.doj%type, 
                        p_leave_date emp_mas.leave_date%type, 
                        p_sex        emp_mas.sex%type, 
                        p_blood_grp  emp_mas.blood_grp%type, 
                        p_phone1     emp_mas.phone1%type, 
                        p_phone2     emp_mas.phone2%type, 
                        /*p_photo         EMP_MAS.PHOTO%type,*/ 
                        p_add1       emp_mas.add1%type, 
                        p_add2       emp_mas.add2%type, 
                        p_city       emp_mas.city%type, 
                        p_state      emp_mas.state%type, 
                        p_pincode    emp_mas.pincode%type, 
                        p_email_id   emp_mas.email_id%type, 
                        p_upd_user   emp_mas.upd_user%type, 
                        p_upd_term   emp_mas.upd_term%type, 
                        p_time_stamp in out emp_mas.time_stamp%type, 
                        p_flg        out varchar2, 
                        p_msg        out varchar2) 
  as 
    v_cnt            number(2); 
    v_entity_type_id number; 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_upd 
      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      update emp_mas 
         set /*GR_NO      = p_gr_no,*/ 
      f_name = p_f_name, 
      m_name = p_m_name, 
      l_name = p_l_name, 
      dob = p_dob, 
      doj = p_doj, 
      leave_date = p_leave_date, 
      sex = p_sex, 
      blood_grp = p_blood_grp, 
      phone1 = p_phone1, 
      phone2 = p_phone2, 
      /*PHOTO      = p_photo,*/ 
      add1 = p_add1, 
      add2 = p_add2, 
      city = p_city, 
      state = p_state, 
      pincode = p_pincode, 
      email_id = p_email_id, 
      upd_date = v_sysdate, 
      upd_user = p_upd_user, 
      upd_term = p_upd_term, 
      time_stamp = v_timestamp 
       where branch = p_branch 
         and entity_id = p_entity_id 
         and time_stamp = p_time_stamp; 

      if sql%rowcount > 0 then 
        begin 
            select entity_type_id 
              into v_entity_type_id 
              from entity_type_mas a 
             where a.entity_type_name = upper(p_emp_type); 
        exception 
            when no_data_found then 
              p_flg := 'N'; 

              p_msg := 'Type not found in type master'; 

              return; 
        end; update entity_mas a set a.entity_type_id = p_emp_type, 
      a.entity_name 
      = 
      p_f_name, a.is_active = 'Y', a.upd_date = v_sysdate, a.upd_user = 
      p_upd_user 
      , 
      a.upd_term = p_upd_term, a.time_stamp = v_timestamp where a.entity_id = 
      p_entity_id; if 
      sql%rowcount > 0 then p_time_stamp := v_timestamp; p_flg := 'Y'; p_msg := 
      pkg_tuition_base.fun_get_update_msg(); return; end if; 
      else 
        select count(*) 
          into v_cnt 
          from emp_mas a 
         where a.branch = p_branch 
           and a.entity_id = p_entity_id 
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
  end prc_emp_upd; 
  --------------------------------------------------- 
  procedure prc_emp_del(p_branch    emp_mas.branch%type, 
                        p_entity_id emp_mas.entity_id%type, 
                        p_flg       out varchar2, 
                        p_msg       out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from emp_mas a 
       where a.branch = p_branch 
         and a.entity_id = p_entity_id; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := pkg_tuition_base.fun_get_delete_msg(); 
      else 
        p_flg := 'N'; 

        p_msg := pkg_tuition_base.fun_get_delete_err(); 

        return; 
      end if; 
  end prc_emp_del; 
  --------------------------------------------------- 
  procedure prc_emp_get_data(p_criteria varchar2, 
                             p_data     out REF_CUR) 
  as 
    v_str varchar2(1000); 
  begin 
      v_str := 'select (SELECT C.ENTITY_TYPE_NAME FROM ENTITY_TYPE_MAS C WHERE C.ENTITY_TYPE_ID = B.ENTITY_TYPE_ID) ENTITY_TYPE_ID,a.* from emp_mas a,entity_mas b where a.entity_id = b.entity_id and ' 
               ||p_criteria; 

      open p_data for v_str; 
  end; 
end pkg_emp_mas;

/
