DROP PROCEDURE IF EXISTS sp_animais_upd;

CREATE PROCEDURE sp_animais_upd(IN p_animal_id INT(11), IN p_nome VARCHAR(255), IN p_idade INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
BEGIN
  SET p_status = FALSE;
  SET p_msg = '';

  -- Validações
  IF p_nome IS NULL THEN
    SET p_msg = CONCAT(p_msg, 'Nome não informado');
  END IF;

  IF p_msg = '' THEN
    START TRANSACTION;
      UPDATE animais SET nome = p_nome, idade = p_idade WHERE id = p_animal_id;
      SET p_status = TRUE;
      SET p_msg = 'Animal atualizado com sucesso!';
    COMMIT;
  END IF;
END;
