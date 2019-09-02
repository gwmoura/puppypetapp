DROP PROCEDURE IF EXISTS sp_animais_ins;

DELIMITER $$

CREATE PROCEDURE sp_animais_ins(IN p_nome VARCHAR(255), INOUT p_status BOOLEAN, INOUT p_msg TEXT, INOUT p_insert_id INT(11))
BEGIN

    SET p_status = TRUE;
    SET p_msg = '';

    -- Validações

    IF p_nome IS NULL THEN
      p_msg = CONCAT(p_msg, 'Nome do animal não informado');
    END IF;

    IF p_msg = '' THEN
      BEGIN TRANSACTION;
        INSERT INTO animais (nome) VALUES (p_nome);
        SET p_insert_id = LAST_INSERTED_ID();

        SET p_msg = ''
      COMMIT;
    ELSE
      SET p_status = FALSE;
    END IF;
END
$$

DELIMITER ;

DROP PROCEDURE IF EXISTS sp_animais_del;

DELIMITER $$

CREATE PROCEDURE sp_animais_del(IN p_animal_id INT(11), INOUT p_status BOOLEAN, INOUT p_msg TEXT)
BEGIN

    SET p_status = TRUE;
    SET p_msg = '';

    -- Validações

    IF p_animal_id IS NULL THEN
      p_msg = CONCAT(p_msg, 'Animal não informado');
    END IF;

    IF p_msg = '' THEN
      BEGIN TRANSACTION;
        DELETE FROM animais WHERE id = p_animal_id;

        SET p_msg = 'Animal deletado com sucesso!';
      COMMIT;
    ELSE
      SET p_status = FALSE;
    END IF;
END
$$

DELIMITER ;
