CREATE OR REPLACE VIEW vw_animais AS
  SELECT
    id,
    nome,
    data_criacao,
    DATE_FORMAT(data_criacao, '%d/%m/%Y %H:%i:%s') AS  data_criacao_formatada
  FROM animais;
