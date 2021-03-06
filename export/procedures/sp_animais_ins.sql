DROP PROCEDURE IF EXISTS sp_animais_ins;
CREATE PROCEDURE sp_animais_ins(IN p_nome varchar(255), IN p_data_nascimento DATE, INOUT p_status tinyint(1), INOUT p_msg text, INOUT p_insert_id int(11))
    COMMENT ''
BEGIN
  DECLARE v_idade INT(11);

  SET p_status = TRUE;
  SET p_msg = '';

  -- Validações

  IF p_nome IS NULL THEN
    SET p_msg = CONCAT(p_msg, 'Nome do animal não informado');
  END IF;

  IF p_msg = '' THEN
    START TRANSACTION;
    SET v_idade = fn_idade_animal(p_data_nascimento);
    INSERT INTO animais (nome, data_nascimento, idade) VALUES (p_nome, p_data_nascimento, v_idade);

    SET p_insert_id = LAST_INSERT_ID();

    SET p_msg = '';

    COMMIT;
  ELSE
    SET p_status = FALSE;
  END IF;
END
