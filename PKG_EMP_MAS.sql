--------------------------------------------------------
--  DDL for Package PKG_EMP_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_EMP_MAS" 
as 
  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
  type ref_cur is ref cursor; 
  procedure prc_emp_ins( 
    p_branch     emp_mas.branch%type, 
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
    p_msg        out varchar2 ); 
    
  procedure prc_emp_upd( 
    p_branch     emp_mas.branch%type, 
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
    p_msg        out varchar2 ); 
    
  procedure prc_emp_del( 
    p_branch    emp_mas.branch%type, 
    p_entity_id emp_mas.entity_id%type, 
    p_flg       out varchar2, 
    p_msg       out varchar2 ); 
    
  procedure prc_emp_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
    
end pkg_emp_mas;

/
