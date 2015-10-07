--------------------------------------------------------
--  DDL for Package PKG_GRIDFIELD_MAS
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_GRIDFIELD_MAS" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_seqno            out grid_fields.seqno%type, 
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
    p_msg              out varchar2 ); 
  procedure prc_mas_upd( 
    p_seqno            grid_fields.seqno%type, 
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
    p_msg              out varchar2 ); 
  procedure prc_mas_del( 
    p_seqno grid_fields.seqno%type, 
    p_flg   out varchar2, 
    p_msg   out varchar2 ); 
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
end pkg_gridfield_mas;

/
