CREATE FUNCTION fn_fase_vida(p_ani_data_nascimento DATE) RETURNS VARCHAR(255)
BEGIN
  DECLARE var_fase VARCHAR(255);
  DECLARE int_idade INT(3);

  SET int_idade = fn_idade_animal(p_ani_data_nascimento);

  IF int_idade < 3 THEN 
    SET var_fase = 'criança';
  ELSEIF int_idade > 4 AND  int_idade < 10 THEN
    SET var_fase = 'jovem';
  ELSEIF int_idade > 10 THEN
    SET var_fase = 'adulto';
  END IF;

  RETURN var_fase;
END;