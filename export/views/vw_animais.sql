CREATE OR REPLACE VIEW vw_animais AS select `puppypetdb`.`animais`.`id` AS `id`,`puppypetdb`.`animais`.`nome` AS `nome`,`puppypetdb`.`animais`.`idade` AS `idade`,`puppypetdb`.`animais`.`data_criacao` AS `data_criacao`,date_format(`puppypetdb`.`animais`.`data_criacao`,'%d/%m/%Y %H:%i:%s') AS `data_criacao_formatada` from `puppypetdb`.`animais`