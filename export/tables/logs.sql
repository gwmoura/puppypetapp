CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acao` text,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1