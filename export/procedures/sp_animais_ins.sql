CREATE PROCEDURE sp_animais_ins(IN p_nome varchar(255), INOUT p_status tinyint(1), INOUT p_msg text, INOUT p_insert_id int(11))
    COMMENT ''
BEGIN
    SET p_status = TRUE;
    SET p_msg = '';

    -- Validações

    IF p_nome IS NULL THEN
      SET p_msg = CONCAT(p_msg, 'Nome do animal não informado');
    END IF;

    IF p_msg = '' THEN
      START TRANSACTION;
        INSERT INTO animais (nome) VALUES (p_nome);

        SET p_insert_id = LAST_INSERT_ID();

        SET p_msg = '';
      COMMIT;
    ELSE
      SET p_status = FALSE;
    END IF;
END