--------------------------------------------------------
--  DDL for Package PKG_TRANSACTION_SETTING
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_TRANSACTION_SETTING" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_batch_id           transaction_setting.batch_id%type, 
    p_seqno              out transaction_setting.seqno%type, 
    p_ref_entity_type_id transaction_setting.ref_entity_type_id%type, 
    p_amount             transaction_setting.amount%type, 
    p_cash_chq_ratio     transaction_setting.cash_chq_ratio%type, 
    p_allow_emi          transaction_setting.allow_emi%type, 
    p_allow_advance      transaction_setting.allow_advance%type, 
    p_no_of_emi          transaction_setting.no_of_emi%type, 
    p_discount           transaction_setting.discount%type, 
    p_remark             transaction_setting.remark%type, 
    p_ent_term           transaction_setting.ent_term%type, 
    p_ent_user           transaction_setting.ent_user%type, 
    p_time_stamp         out transaction_setting.time_stamp%type, 
    p_flg                out varchar2, 
    p_msg                out varchar2 ); 
  procedure prc_mas_upd( 
    p_batch_id           transaction_setting.batch_id%type, 
    p_seqno              transaction_setting.seqno%type, 
    p_ref_entity_type_id transaction_setting.ref_entity_type_id%type, 
    p_amount             transaction_setting.amount%type, 
    p_cash_chq_ratio     transaction_setting.cash_chq_ratio%type, 
    p_allow_emi          transaction_setting.allow_emi%type, 
    p_allow_advance      transaction_setting.allow_advance%type, 
    p_no_of_emi          transaction_setting.no_of_emi%type, 
    p_discount           transaction_setting.discount%type, 
    p_remark             transaction_setting.remark%type, 
    p_upd_term           transaction_setting.upd_term%type, 
    p_upd_user           transaction_setting.upd_user%type, 
    p_time_stamp         in out transaction_setting.time_stamp%type, 
    p_flg                out varchar2, 
    p_msg                out varchar2 ); 
  procedure prc_mas_del( 
    p_seqno transaction_setting.seqno%type, 
    p_flg   out varchar2, 
    p_msg   out varchar2 ); 
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
end pkg_transaction_setting;

/
