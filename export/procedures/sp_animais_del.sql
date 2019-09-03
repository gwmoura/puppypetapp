CREATE PROCEDURE sp_animais_del(IN p_animal_id int(11), INOUT p_status tinyint(1), INOUT p_msg text)
    COMMENT ''
BEGIN
    SET p_status = TRUE;
    SET p_msg = '';

    -- Validações

    IF p_animal_id IS NULL THEN
      SET p_msg = CONCAT(p_msg, 'Animal não informado');
    END IF;

    IF p_msg = '' THEN
      START TRANSACTION;
        DELETE FROM animais WHERE id = p_animal_id;

        SET p_msg = 'Animal deletado com sucesso!';
      COMMIT;
    ELSE
      SET p_status = FALSE;
    END IF;
END