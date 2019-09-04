CREATE PROCEDURE sp_log_ins(IN p_acao text, INOUT p_status tinyint(1), INOUT p_msg text)
    COMMENT ''
BEGIN
  START TRANSACTION;
    INSERT INTO logs (acao) VALUES (p_acao);
    SET p_status = TRUE;
    SET p_msg = 'Log criado com sucesso!';
  COMMIT;
END