DROP FUNCTION IF EXISTS fn_idade_animal;

CREATE FUNCTION fn_idade_animal(dat_nascimento date)
  RETURNS int(11)
begin
  -- função para calcular idade do animal
  return DATEDIFF(dat_nascimento, CURRENT_DATE());
end
