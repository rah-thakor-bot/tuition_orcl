--------------------------------------------------------
--  DDL for Package PKG_MONEY_FLOW
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "HR"."PKG_MONEY_FLOW" 
as 
  type ref_cur is ref cursor; 
  procedure prc_mas_ins( 
    p_branch         money_flow.branch%type, 
    p_trn_id         out money_flow.trn_id%type, 
    p_trn_type       money_flow.trn_type%type, 
    p_from_type      money_flow.from_type%type, 
    p_from_entity_id money_flow.from_entity_id%type, 
    p_to_type        money_flow.to_type%type, 
    p_to_entity_id   money_flow.to_entity_id%type, 
    p_amt            money_flow.amt%type, 
    p_t_date         money_flow.t_date%type, 
    p_concern_prsn   money_flow.concern_prsn%type, 
    p_ent_term       money_flow.ent_term%type, 
    p_ent_user       money_flow.ent_user%type, 
    p_time_stamp     out money_flow.time_stamp%type, 
    p_flg            out varchar2, 
    p_msg            out varchar2 ); 
  procedure prc_mas_upd( 
    p_branch         money_flow.branch%type, 
    p_trn_id         money_flow.trn_id%type, 
    p_trn_type       money_flow.trn_type%type, 
    p_from_type      money_flow.from_type%type, 
    p_from_entity_id money_flow.from_entity_id%type, 
    p_to_type        money_flow.to_type%type, 
    p_to_entity_id   money_flow.to_entity_id%type, 
    p_amt            money_flow.amt%type, 
    p_t_date         money_flow.t_date%type, 
    p_concern_prsn   money_flow.concern_prsn%type, 
    p_upd_term       money_flow.upd_term%type, 
    p_upd_user       money_flow.upd_user%type, 
    p_time_stamp     in out money_flow.time_stamp%type, 
    p_flg            out varchar2, 
    p_msg            out varchar2 ); 
  procedure prc_mas_del( 
    p_branch money_flow.branch%type, 
    p_trn_id money_flow.trn_id%type, 
    p_flg    out varchar2, 
    p_msg    out varchar2 ); 
  procedure prc_mas_get_data( 
    p_criteria varchar2, 
    p_data     out REF_CUR ); 
end pkg_money_flow;

/
