CREATE PROCEDURE sp_animais_upd(IN p_animal_id int(11), IN p_nome varchar(255), INOUT p_status tinyint(1), INOUT p_msg text)
    COMMENT ''
BEGIN
  SET p_status = FALSE;
  SET p_msg = '';

  -- Validações
  IF p_nome IS NULL THEN
    SET p_msg = CONCAT(p_msg, 'Nome não informado');
  END IF;

  IF p_msg = '' THEN
    START TRANSACTION;
      UPDATE animais SET nome = p_nome WHERE id = p_animal_id;
      SET p_status = TRUE;
      SET p_msg = 'Animal atualizado com sucesso!';
    COMMIT;
  END IF;
END