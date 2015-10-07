--------------------------------------------------------
--  DDL for Package Body PKG_GRIDFIELD_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "HR"."PKG_GRIDFIELD_MAS" 
as 
  procedure prc_mas_ins(p_seqno            out grid_fields.seqno%type, 
                        p_menu_name        grid_fields.menu_name%type, 
                        p_ord              grid_fields.ord%type, 
                        p_ctrl_name        grid_fields.ctrl_name%type, 
                        p_data_field_name  grid_fields.data_field_name%type, 
                        p_field_size       grid_fields.field_size%type, 
                        p_disp_name        grid_fields.disp_name%type, 
                        p_col_type         grid_fields.col_type%type, 
                        p_combo_flg        grid_fields.combo_flg%type, 
                        p_combo_bind_id    grid_fields.combo_bind_id%type, 
                        p_excel_field_name grid_fields.excel_field_name%type, 
                        p_remark           grid_fields.remark%type, 
                        p_extra_remark     grid_fields.extra_remark%type, 
                        p_flg              out varchar2, 
                        p_msg              out varchar2) 
  as 
  begin 
      select nvl(max(seqno), 0) + 1 
        into p_seqno 
        from grid_fields; 

      insert into grid_fields 
                  (menu_name, 
                   ctrl_name, 
                   data_field_name, 
                   field_size, 
                   disp_name, 
                   col_type, 
                   combo_flg, 
                   combo_bind_id, 
                   excel_field_name, 
                   remark, 
                   extra_remark, 
                   ord, 
                   seqno) 
           values ( p_menu_name, 
                   p_ctrl_name, 
                   p_data_field_name, 
                   p_field_size, 
                   p_disp_name, 
                   p_col_type, 
                   p_combo_flg, 
                   p_combo_bind_id, 
                   p_excel_field_name, 
                   p_remark, 
                   p_extra_remark, 
                   p_ord, 
                   p_seqno ); 

      if sql%rowcount > 0 then 
        p_flg := 'Y'; 

        p_msg := sql%rowcount 
                 ||' record(s) successfully saved!'; 

        return; 
      else 
        p_flg := 'N'; 

        p_msg := 'Problem in inserting record!'; 
      end if; 
  end prc_mas_ins; 
  procedure prc_mas_upd(p_seqno            grid_fields.seqno%type, 
                        p_menu_name        grid_fields.menu_name%type, 
                        p_ord              grid_fields.ord%type, 
                        p_ctrl_name        grid_fields.ctrl_name%type, 
                        p_data_field_name  grid_fields.data_field_name%type, 
                        p_field_size       grid_fields.field_size%type, 
                        p_disp_name        grid_fields.disp_name%type, 
                        p_col_type         grid_fields.col_type%type, 
                        p_combo_flg        grid_fields.combo_flg%type, 
                        p_combo_bind_id    grid_fields.combo_bind_id%type, 
                        p_excel_field_name grid_fields.excel_field_name%type, 
                        p_remark           grid_fields.remark%type, 
                        p_extra_remark     grid_fields.extra_remark%type, 
                        p_flg              out varchar2, 
                        p_msg              out varchar2) 
  as 
  begin 
      update grid_fields 
         set menu_name = p_menu_name, 
             ctrl_name = p_ctrl_name, 
             data_field_name = p_data_field_name, 
             field_size = p_field_size, 
             disp_name = p_disp_name, 
             col_type = p_col_type, 
             combo_flg = p_combo_flg, 
             combo_bind_id = p_combo_bind_id, 
             excel_field_name = p_excel_field_name, 
             remark = p_remark, 
             extra_remark = p_extra_remark, 
             ord = p_ord 
       where seqno = p_seqno; 

      null; 
  end prc_mas_upd; 
  procedure prc_mas_del(p_seqno grid_fields.seqno%type, 
                        p_flg   out varchar2, 
                        p_msg   out varchar2) 
  as 
  begin 
      -- TODO Implementation required for procedure PKG_EMP_MAS.prc_emp_del 
      delete from grid_fields a 
       where a.seqno = p_seqno; 

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
      v_str := 'SELECT SEQNO, MENU_NAME, CTRL_NAME, DATA_FIELD_NAME, FIELD_SIZE, DISP_NAME, COL_TYPE, COMBO_FLG, COMBO_BIND_ID, EXCEL_FIELD_NAME, REMARK, EXTRA_REMARK, ORD FROM GRID_FIELDS  a WHERE  1 = 1 and ' 
               ||p_criteria 
               ||' ORDER BY CTRL_NAME,ORD'; 

      open p_data for v_str; 
  end; 
end pkg_gridfield_mas;

/
