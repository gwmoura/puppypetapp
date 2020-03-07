CREATE FUNCTION fn_idade_animal(dat_nascimento DATE) RETURNS INT(11)
  COMMENT 'função para calcular idade do animal'
BEGIN
  RETURN ROUND(DATEDIFF(CURRENT_DATE(), dat_nascimento) / 365, 0);
END
