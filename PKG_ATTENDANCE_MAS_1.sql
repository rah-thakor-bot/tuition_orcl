--------------------------------------------------------
--  DDL for Package Body PKG_ATTENDANCE_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_ATTENDANCE_MAS" 
as 
  v_sysdate   date; 
  v_timestamp varchar2(50); 
  procedure prc_mas_ins(p_seqno           out attendance_mas.seqno%type, 
                        p_entity_id       attendance_mas.entity_id%type, 
                        p_entity_type_id  attendance_mas.entity_type_id%type, 
                        p_batch_id        attendance_mas.batch_id%type, 
                        p_attendance_date attendance_mas.attendance_date%type, 
                        p_attendance_time attendance_mas.attendance_time%type, 
                        p_attendance_flg  attendance_mas.flg%type, 
                        p_ent_term        attendance_mas.ent_term%type, 
                        p_ent_user        attendance_mas.ent_user%type, 
                        p_time_stamp      out attendance_mas.time_stamp%type, 
                        p_flg             out varchar2, 
                        p_msg             out varchar2) 
  as 
  begin 
      v_sysdate := sysdate; 
      v_timestamp := to_char(systimestamp); 

      select max(nvl(seqno, 0)) + 1 
      into   p_seqno 
      from   attendance_mas; 

      begin 
          insert into attendance_mas 
                      (seqno, 
                       entity_id, 
                       entity_type_id, 
                       batch_id, 
                       attendance_date, 
                       attendance_time, 
                       flg, 
                       ent_date, 
                       ent_user, 
                       ent_term, 
                       time_stamp) 
          values      (p_seqno, 
                       p_entity_id, 
                       p_entity_type_id, 
                       p_batch_id, 
                       p_attendance_date, 
                       p_attendance_time, 
                       p_attendance_flg, 
                       v_sysdate, 
                       p_ent_user, 
                       p_ent_term, 
                       v_timestamp); 

          if sql%rowcount > 0 then 
            p_flg := 'Y'; 
            p_msg := pkg_tuition_base.fun_get_save_msg(); 
          else 
            p_flg := 'N'; 
            p_msg := pkg_tuition_base.fun_get_save_err(); 
          end if; 
      exception 
          when others then 
            raise_application_error(-20111, 
            pkg_tuition_base.fun_get_save_err()); 
      end; 
  end prc_mas_ins; 
  
  procedure prc_mas_upd(p_seqno           attendance_mas.seqno%type, 
                        p_entity_id       attendance_mas.entity_id%type, 
                        p_entity_type_id  attendance_mas.entity_type_id%type, 
                        p_batch_id        attendance_mas.batch_id%type, 
                        p_attendance_date attendance_mas.attendance_date%type, 
                        p_attendance_time attendance_mas.attendance_time%type, 
                        p_attendance_flg  attendance_mas.flg%type, 
                        p_upd_term        attendance_mas.upd_term%type, 
                        p_upd_user        attendance_mas.upd_user%type, 
                        p_time_stamp      in out attendance_mas.time_stamp%type, 
                        p_flg             out varchar2, 
                        p_msg             out varchar2) 
  as 
  begin 
      v_sysdate := sysdate; 
      v_timestamp := to_char(systimestamp); 

      begin 
          update attendance_mas 
          set    entity_id = p_entity_id, 
                 entity_type_id = p_entity_type_id, 
                 attendance_date = p_attendance_date, 
                 attendance_time = p_attendance_time, 
                 upd_date = v_sysdate, 
                 upd_user = p_upd_user, 
                 upd_term = p_upd_term, 
                 time_stamp = v_timestamp, 
                 flg = p_attendance_flg, 
                 batch_id = p_batch_id 
          where  seqno = p_seqno; 
          if sql%rowcount > 0 then 
            p_flg := 'Y'; 
            p_msg := pkg_tuition_base.fun_get_update_msg(); 
          else 
            p_flg := 'N'; 
            p_msg := pkg_tuition_base.fun_get_update_err(); 
          end if; 
      exception 
          when others then 
            raise_application_error(-20111, 
            pkg_tuition_base.fun_get_update_err()); 
      end; 
  end prc_mas_upd; 
  
  procedure prc_mas_del(p_seqno attendance_mas.seqno%type, 
                        p_flg   out varchar2, 
                        p_msg   out varchar2) 
  as 
  begin 
     begin
     DELETE FROM ATTENDANCE_MAS
           WHERE SEQNO = p_seqno;
     if sql%rowcount > 0 then 
            p_flg := 'Y'; 
            p_msg := pkg_tuition_base.fun_get_delete_msg(); 
          else 
            p_flg := 'N'; 
            p_msg := pkg_tuition_base.fun_get_delete_err(); 
          end if; 
      exception 
          when others then 
            raise_application_error(-20111, 
            pkg_tuition_base.fun_get_delete_err());
     end;
  end prc_mas_del; 
  
  procedure prc_mas_get_data(p_criteria varchar2, 
                             p_data     out REF_CUR) 
  as 
  v_str varchar2(1000);
  begin
    begin
    v_str := 'SELECT SEQNO,
              BATCH_ID
              ENTITY_ID,
              ENTITY_TYPE_ID,
              ATTENDANCE_DATE,
              ATTENDANCE_TIME,
              FLG ATTENDANCE_FLG,
              TIME_STAMP
         FROM ATTENDANCE_MAS 
        WHERE 1 = 1 
          AND ' || p_criteria;
     open p_data for v_str;
    exception
          when no_data_found then
            return;
          when others then 
            raise_application_error(-20111, 
            pkg_tuition_base.fun_get_data_err());   
    end;     
  end prc_mas_get_data; 
  
end pkg_attendance_mas;

/
