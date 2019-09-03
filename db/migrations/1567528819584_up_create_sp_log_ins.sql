DROP PROCEDURE IF EXISTS sp_log_ins;

CREATE PROCEDURE sp_log_ins(IN p_acao TEXT, INOUT p_status BOOLEAN, INOUT p_msg TEXT)
BEGIN
  START TRANSACTION;
    INSERT INTO logs (acao) VALUES (p_acao);
    SET p_status = TRUE;
    SET p_msg = 'Log criado com sucesso!';
  COMMIT;
END;
