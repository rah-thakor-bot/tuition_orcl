--------------------------------------------------------
--  DDL for Package Body PKG_RESULT_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_RESULT_MAS" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_exam_id        result_mas.exam_id%type, 
                        p_entity_id      result_mas.entity_id%type, 
                        p_entity_type_id result_mas.entity_type_id%type, 
                        p_score          result_mas.score%type, 
                        p_remark         result_mas.remark%type, 
                        p_srno           out result_mas.srno%type, 
                        p_ent_term       result_mas.ent_term%type, 
                        p_ent_user       result_mas.ent_user%type, 
                        p_time_stamp     out result_mas.time_stamp%type, 
                        p_flg            out varchar2, 
                        p_msg            out varchar2) 
  as 
  begin 
      begin 
          select nvl(max(p_srno), 0) + 1 
            into p_srno 
            from result_mas; 

          v_sysdate := sysdate; 

          v_timestamp := to_char(systimestamp); 

          insert into result_mas 
                      (exam_id, 
                       entity_id, 
                       entity_type_id, 
                       score, 
                       remark, 
                       srno, 
                       ent_date, 
                       ent_user, 
                       ent_term, 
                       time_stamp) 
               values ( p_exam_id, 
                       p_entity_id, 
                       p_entity_type_id, 
                       p_score, 
                       p_remark, 
                       p_srno, 
                       v_sysdate, 
                       p_ent_term, 
                       p_ent_user, 
                       v_timestamp ); 

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
  end prc_mas_ins; 
  procedure prc_mas_upd(p_exam_id        result_mas.exam_id%type, 
                        p_entity_id      result_mas.entity_id%type, 
                        p_entity_type_id result_mas.entity_type_id%type, 
                        p_score          result_mas.score%type, 
                        p_remark         result_mas.remark%type, 
                        p_srno           result_mas.srno%type, 
                        p_upd_term       result_mas.upd_term%type, 
                        p_upd_user       result_mas.upd_user%type, 
                        p_time_stamp     in out exam_mas.time_stamp%type, 
                        p_flg            out varchar2, 
                        p_msg            out varchar2) 
  as 
    v_cnt number(3); 
  begin 
      v_sysdate := sysdate; 

      v_timestamp := to_char(systimestamp); 

      update result_mas 
         set exam_id = p_exam_id, 
             entity_id = p_entity_id, 
             entity_type_id = p_entity_type_id, 
             score = p_score, 
             remark = p_remark, 
             upd_date = v_sysdate, 
             upd_user = p_upd_user, 
             upd_term = p_upd_term, 
             time_stamp = v_timestamp 
       where srno = p_srno 
         and time_stamp = p_time_stamp; 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_time_stamp := v_timestamp; 

        p_msg := pkg_tuition_base.fun_get_update_msg(); 

        return; 
      else 
        select count(1) 
          into v_cnt 
          from result_mas a 
         where srno = p_srno 
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
  end prc_mas_upd; 
  procedure prc_mas_del(p_srno result_mas.srno%type, 
                        p_flg  out varchar2, 
                        p_msg  out varchar2) 
  as 
  begin 
      delete from result_mas a 
       where p_srno = p_srno; 

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
  procedure prc_mas_get_data(p_criteria varchar2, 
                             p_data     out REF_CUR) 
  as 
    v_str varchar2(1000); 
  begin 
      v_str := 'SELECT a.SRNO, a.EXAM_ID, a.ENTITY_ID, a.ENTITY_TYPE_ID, a.SCORE, a.REMARK, a.TIME_STAMP TIMESTAMP FROM RESULT_MAS a where 1 = 1 and ' 
               ||p_criteria; 

      open p_data for v_str; 
  exception 
    when others then 
               raise_application_error(-20010, 'Problem in fetching batch data'); 
  end prc_mas_get_data; 
end pkg_result_mas;

/
