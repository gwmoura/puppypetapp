DROP PROCEDURE IF EXISTS sp_animais_ins;

CREATE PROCEDURE sp_animais_ins(IN p_nome VARCHAR(255), IN p_idade INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
BEGIN
    SET p_status = TRUE;
    SET p_msg = '';

    -- Validações

    IF p_nome IS NULL THEN
      SET p_msg = CONCAT(p_msg, 'Nome do animal não informado');
    END IF;

    IF p_msg = '' THEN
      START TRANSACTION;
        INSERT INTO animais (nome, idade) VALUES (p_nome, p_idade);

        SET p_insert_id = LAST_INSERT_ID();

        SET p_msg = '';
      COMMIT;
    ELSE
      SET p_status = FALSE;
    END IF;
END
;
