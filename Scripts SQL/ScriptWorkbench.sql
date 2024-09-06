-- -----------------------------------------------------
-- Table `CACADOR_DE_RECOMPENSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CACADOR_DE_RECOMPENSA` (
  `especialidade` VARCHAR(255) NOT NULL,
  `equipamentos` VARCHAR(255) NOT NULL,
  `cacador_cum` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cacador_cum`),
  CONSTRAINT `fk_CACADOR_RECOMPENSA_MAGIZOOLOGISTA1`
    FOREIGN KEY (`cacador_cum`)
    REFERENCES `MAGIZOOLOGISTA` (`cum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CAPTURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CAPTURA` (
  `quantidade_capturada` INT NOT NULL,
  `cacador_cum` VARCHAR(15) NOT NULL,
  `idcriatura` INT NOT NULL,
  `classe_criatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cacador_cum`, `idcriatura`, `classe_criatura`),
  INDEX `fk_CAPTURA_CRIATURA1_idx` (`idcriatura` ASC, `classe_criatura` ASC) VISIBLE,
  CONSTRAINT `fk_CAPTURA_CACADOR_DE_RECOMPENSA1`
    FOREIGN KEY (`cacador_cum`)
    REFERENCES `CACADOR_DE_RECOMPENSA` (`cacador_cum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAPTURA_CRIATURA1`
    FOREIGN KEY (`idcriatura` , `classe_criatura`)
    REFERENCES `CRIATURA` (`idcriatura` , `classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CARACTERISTICA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CARACTERISTICA` (
  `id_característica` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `classe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_característica`, `classe`),
  UNIQUE INDEX `id_característica_UNIQUE` (`id_característica` ASC) VISIBLE,
  INDEX `fk_CARACTERISTICAS_CLASSE1_idx` (`classe` ASC) VISIBLE,
  CONSTRAINT `fk_CARACTERISTICAS_CLASSE1`
    FOREIGN KEY (`classe`)
    REFERENCES `CLASSE` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CLASSE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CLASSE` (
  `nome` VARCHAR(45) NOT NULL,
  `mito` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`nome`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRIATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRIATURA` (
  `idcriatura` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_nasc` DATE NOT NULL,
  `historia` VARCHAR(255) NULL,
  `classe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcriatura`, `classe`),
  UNIQUE INDEX `idcriatura_UNIQUE` (`idcriatura` ASC) VISIBLE,
  INDEX `fk_criatura_classe1_idx` (`classe` ASC) VISIBLE,
  CONSTRAINT `fk_criatura_classe1`
    FOREIGN KEY (`classe`)
    REFERENCES `CLASSE` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRIATURA_TEM_PODER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRIATURA_TEM_PODER` (
  `idcriatura` INT NOT NULL,
  `classe_criatura` VARCHAR(45) NOT NULL,
  `poder` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcriatura`, `classe_criatura`, `poder`),
  INDEX `fk_poder_has_criatura_poder1_idx` (`poder` ASC) VISIBLE,
  CONSTRAINT `fk_poder_has_criatura_criatura1`
    FOREIGN KEY (`idcriatura` , `classe_criatura`)
    REFERENCES `CRIATURA` (`idcriatura` , `classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_poder_has_criatura_poder1`
    FOREIGN KEY (`poder`)
    REFERENCES `PODER` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GUARDIAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GUARDIAO` (
  `nivel_protecao` INT NOT NULL,
  `guardiao_cum` VARCHAR(15) NOT NULL,
  `data_formacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`guardiao_cum`),
  INDEX `fk_GUARDIAO_MAGIZOOLOGISTA1_idx` (`guardiao_cum` ASC) VISIBLE,
  CONSTRAINT `fk_GUARDIAO_MAGIZOOLOGISTA1`
    FOREIGN KEY (`guardiao_cum`)
    REFERENCES `MAGIZOOLOGISTA` (`cum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HEROI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HEROI` (
  `nome` VARCHAR(45) NOT NULL,
  `historia` VARCHAR(255) NOT NULL,
  `idcriatura_associada` INT NOT NULL,
  `iduniverso_origem` INT NOT NULL,
  PRIMARY KEY (`nome`, `idcriatura_associada`, `iduniverso_origem`),
  UNIQUE INDEX `nome_heroi_UNIQUE` (`nome` ASC) VISIBLE,
  INDEX `fk_heroi_criatura_idx` (`idcriatura_associada` ASC) VISIBLE,
  INDEX `fk_heroi_universo1_idx` (`iduniverso_origem` ASC) VISIBLE,
  CONSTRAINT `fk_heroi_criatura`
    FOREIGN KEY (`idcriatura_associada`)
    REFERENCES `CRIATURA` (`idcriatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_heroi_universo1`
    FOREIGN KEY (`iduniverso_origem`)
    REFERENCES `UNIVERSO` (`iduniverso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LOCALIZACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LOCALIZACAO` (
  `id_localizacao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `regiao` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_localizacao`),
  UNIQUE INDEX `id_localizacao_UNIQUE` (`id_localizacao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MAGIZOOLOGISTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MAGIZOOLOGISTA` (
  `cum` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_nasc` DATE NOT NULL,
  PRIMARY KEY (`cum`),
  UNIQUE INDEX `cum_UNIQUE` (`cum` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NIVEL_PERIGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NIVEL_PERIGO` (
  `nome` ENUM('baixo', 'medio', 'alto', 'altissimo') NOT NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PODER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PODER` (
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `poder_gerador` VARCHAR(45) NOT NULL,
  `nivel_perigo` ENUM('baixo', 'medio', 'alto', 'altissimo') NOT NULL,
  PRIMARY KEY (`nome`, `poder_gerador`, `nivel_perigo`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC) VISIBLE,
  INDEX `fk_PODER_PODER1_idx` (`poder_gerador` ASC) VISIBLE,
  INDEX `fk_PODER_NIVEL_PERIGO1_idx` (`nivel_perigo` ASC) VISIBLE,
  CONSTRAINT `fk_PODER_PODER1`
    FOREIGN KEY (`poder_gerador`)
    REFERENCES `PODER` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PODER_NIVEL_PERIGO1`
    FOREIGN KEY (`nivel_perigo`)
    REFERENCES `NIVEL_PERIGO` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROTEGE` (
  `nivel_protecao` INT NOT NULL,
  `guardiao_cum` VARCHAR(15) NOT NULL,
  `idcriatura` INT NOT NULL,
  `classe_criatura` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`guardiao_cum`, `idcriatura`, `classe_criatura`),
  INDEX `fk_PROTEGE_CRIATURA1_idx` (`idcriatura` ASC, `classe_criatura` ASC) VISIBLE,
  CONSTRAINT `fk_PROTEGE_GUARDIAO1`
    FOREIGN KEY (`guardiao_cum`)
    REFERENCES `GUARDIAO` (`guardiao_cum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROTEGE_CRIATURA1`
    FOREIGN KEY (`idcriatura` , `classe_criatura`)
    REFERENCES `CRIATURA` (`idcriatura` , `classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `REGISTRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `REGISTRO` (
  `id_registro` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `idcriatura` INT NOT NULL,
  `classe_criatura` VARCHAR(45) NOT NULL,
  `cum_magizoologista` VARCHAR(15) NOT NULL,
  `id_localizacao` INT NOT NULL,
  PRIMARY KEY (`id_registro`, `idcriatura`, `classe_criatura`, `cum_magizoologista`, `id_localizacao`),
  UNIQUE INDEX `id_registro_UNIQUE` (`id_registro` ASC) VISIBLE,
  INDEX `fk_REGISTRO_CRIATURA1_idx` (`idcriatura` ASC, `classe_criatura` ASC) VISIBLE,
  INDEX `fk_REGISTRO_MAGIZOOLOGISTA1_idx` (`cum_magizoologista` ASC) VISIBLE,
  INDEX `fk_REGISTRO_LOCALIZACAO1_idx` (`id_localizacao` ASC) VISIBLE,
  CONSTRAINT `fk_REGISTRO_CRIATURA1`
    FOREIGN KEY (`idcriatura` , `classe_criatura`)
    REFERENCES `CRIATURA` (`idcriatura` , `classe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTRO_MAGIZOOLOGISTA1`
    FOREIGN KEY (`cum_magizoologista`)
    REFERENCES `MAGIZOOLOGISTA` (`cum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_REGISTRO_LOCALIZACAO1`
    FOREIGN KEY (`id_localizacao`)
    REFERENCES `LOCALIZACAO` (`id_localizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UNIVERSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UNIVERSO` (
  `iduniverso` INT NOT NULL AUTO_INCREMENT,
  `ano_surgimento` INT NOT NULL,
  `historia_origem` VARCHAR(45) NULL,
  PRIMARY KEY (`iduniverso`),
  UNIQUE INDEX `iduniverso_UNIQUE` (`iduniverso` ASC) VISIBLE)
ENGINE = InnoDB;


