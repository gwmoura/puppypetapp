drop function if exists fn_idade_animal;

create function fn_idade_animal(dat_nascimento DATE)
returns int(11)
begin
  -- função
  return DATEDIFF(dat_nascimento, CURRENT_DATE());
end;
