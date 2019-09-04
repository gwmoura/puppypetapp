CREATE TRIGGER tg_animais_ins_after
  AFTER INSERT
  ON animais
  FOR EACH ROW
BEGIN
  DECLARE v_nome VARCHAR(255);
  DECLARE v_acao TEXT;

  SET v_nome = NEW.nome;
  SET v_acao = CONCAT('Animal ', v_nome, ' foi cadastrado');
  CALL sp_log_ins(v_acao, @status, @msg);
END