-- -----------------------------------------------------
-- Table CACADOR_DE_RECOMPENSA
-- -----------------------------------------------------
CREATE TABLE CACADOR_DE_RECOMPENSA (
  especialidade VARCHAR(255) NOT NULL,
  equipamentos VARCHAR(255) NOT NULL,
  cacador_cum VARCHAR(15) NOT NULL,
  PRIMARY KEY (cacador_cum),
  CONSTRAINT fk_CACADOR_RECOMPENSA_MAGIZOOLOGISTA1
    FOREIGN KEY (cacador_cum)
    REFERENCES MAGIZOOLOGISTA (cum)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table CAPTURA
-- -----------------------------------------------------
CREATE TABLE CAPTURA (
  quantidade_capturada INTEGER NOT NULL,
  cacador_cum VARCHAR(15) NOT NULL,
  idcriatura INTEGER NOT NULL,
  classe_criatura VARCHAR(45) NOT NULL,
  PRIMARY KEY (cacador_cum, idcriatura, classe_criatura),
  CONSTRAINT fk_CAPTURA_CACADOR_DE_RECOMPENSA1
    FOREIGN KEY (cacador_cum)
    REFERENCES CACADOR_DE_RECOMPENSA (cacador_cum)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CAPTURA_CRIATURA1
    FOREIGN KEY (idcriatura, classe_criatura)
    REFERENCES CRIATURA (idcriatura, classe)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table CARACTERISTICA
-- -----------------------------------------------------
CREATE TABLE CARACTERISTICA (
  id_caracteristica SERIAL PRIMARY KEY,
  descricao VARCHAR(255) NOT NULL,
  classe VARCHAR(45) NOT NULL,
  UNIQUE (id_caracteristica),
  CONSTRAINT fk_CARACTERISTICAS_CLASSE1
    FOREIGN KEY (classe)
    REFERENCES CLASSE (nome)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table CLASSE
-- -----------------------------------------------------
CREATE TABLE CLASSE (
  nome VARCHAR(45) NOT NULL PRIMARY KEY,
  mito VARCHAR(255) NOT NULL
);

-- -----------------------------------------------------
-- Table CRIATURA
-- -----------------------------------------------------
CREATE TABLE CRIATURA (
  idcriatura SERIAL NOT NULL,
  nome VARCHAR(45) NOT NULL,
  data_nasc DATE NOT NULL,
  historia VARCHAR(255),
  classe VARCHAR(45) NOT NULL,
  PRIMARY KEY (idcriatura, classe),
  CONSTRAINT fk_criatura_classe1
    FOREIGN KEY (classe)
    REFERENCES CLASSE (nome)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table CRIATURA_TEM_PODER
-- -----------------------------------------------------
CREATE TABLE CRIATURA_TEM_PODER (
  idcriatura INTEGER NOT NULL,
  classe_criatura VARCHAR(45) NOT NULL,
  poder VARCHAR(45) NOT NULL,
  PRIMARY KEY (idcriatura, classe_criatura, poder),
  CONSTRAINT fk_poder_has_criatura_criatura1
    FOREIGN KEY (idcriatura, classe_criatura)
    REFERENCES CRIATURA (idcriatura, classe)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_poder_has_criatura_poder1
    FOREIGN KEY (poder)
    REFERENCES PODER (nome)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table GUARDIAO
-- -----------------------------------------------------
CREATE TABLE GUARDIAO (
  nivel_protecao INTEGER NOT NULL,
  guardiao_cum VARCHAR(15) NOT NULL,
  data_formacao VARCHAR(45) NOT NULL,
  PRIMARY KEY (guardiao_cum),
  CONSTRAINT fk_GUARDIAO_MAGIZOOLOGISTA1
    FOREIGN KEY (guardiao_cum)
    REFERENCES MAGIZOOLOGISTA (cum)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table HEROI
-- -----------------------------------------------------
CREATE TABLE HEROI (
  nome VARCHAR(45) NOT NULL,
  historia VARCHAR(255) NOT NULL,
  idcriatura_associada INTEGER NOT NULL,
  iduniverso_origem INTEGER NOT NULL,
  PRIMARY KEY (nome, idcriatura_associada, iduniverso_origem),
  CONSTRAINT fk_heroi_criatura
    FOREIGN KEY (idcriatura_associada)
    REFERENCES CRIATURA (idcriatura)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_heroi_universo1
    FOREIGN KEY (iduniverso_origem)
    REFERENCES UNIVERSO (iduniverso)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table LOCALIZACAO
-- -----------------------------------------------------
CREATE TABLE LOCALIZACAO (
  id_localizacao SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  regiao VARCHAR(255) NOT NULL,
  descricao VARCHAR(255) NOT NULL
);

-- -----------------------------------------------------
-- Table MAGIZOOLOGISTA
-- -----------------------------------------------------
CREATE TABLE MAGIZOOLOGISTA (
  cum VARCHAR(15) NOT NULL PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  data_nasc DATE NOT NULL
);

-- -----------------------------------------------------
-- Table NIVEL_PERIGO
-- -----------------------------------------------------
CREATE TYPE NIVEL_PERIGO AS ENUM ('baixo', 'medio', 'alto', 'altissimo');

CREATE TABLE NIVEL_PERIGO (
  nome NIVEL_PERIGO NOT NULL PRIMARY KEY
);

-- -----------------------------------------------------
-- Table PODER
-- -----------------------------------------------------
CREATE TABLE PODER (
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  poder_gerador VARCHAR(45) NOT NULL,
  nivel_perigo NIVEL_PERIGO NOT NULL,
  PRIMARY KEY (nome, poder_gerador, nivel_perigo),
  CONSTRAINT fk_PODER_PODER1
    FOREIGN KEY (poder_gerador)
    REFERENCES PODER (nome)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PODER_NIVEL_PERIGO1
    FOREIGN KEY (nivel_perigo)
    REFERENCES NIVEL_PERIGO (nome)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table PROTEGE
-- -----------------------------------------------------
CREATE TABLE PROTEGE (
  nivel_protecao INTEGER NOT NULL,
  guardiao_cum VARCHAR(15) NOT NULL,
  idcriatura INTEGER NOT NULL,
  classe_criatura VARCHAR(45) NOT NULL,
  PRIMARY KEY (guardiao_cum, idcriatura, classe_criatura),
  CONSTRAINT fk_PROTEGE_GUARDIAO1
    FOREIGN KEY (guardiao_cum)
    REFERENCES GUARDIAO (guardiao_cum)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PROTEGE_CRIATURA1
    FOREIGN KEY (idcriatura, classe_criatura)
    REFERENCES CRIATURA (idcriatura, classe)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table REGISTRO
-- -----------------------------------------------------
CREATE TABLE REGISTRO (
  id_registro SERIAL PRIMARY KEY,
  data DATE NOT NULL,
  idcriatura INTEGER NOT NULL,
  classe_criatura VARCHAR(45) NOT NULL,
  cum_magizoologista VARCHAR(15) NOT NULL,
  id_localizacao INTEGER NOT NULL,
  CONSTRAINT fk_REGISTRO_CRIATURA1
    FOREIGN KEY (idcriatura, classe_criatura)
    REFERENCES CRIATURA (idcriatura, classe)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_REGISTRO_MAGIZOOLOGISTA1
    FOREIGN KEY (cum_magizoologista)
    REFERENCES MAGIZOOLOGISTA (cum)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_REGISTRO_LOCALIZACAO1
    FOREIGN KEY (id_localizacao)
    REFERENCES LOCALIZACAO (id_localizacao)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table UNIVERSO
-- -----------------------------------------------------
CREATE TABLE UNIVERSO (
  iduniverso SERIAL PRIMARY KEY,
  ano_surgimento INTEGER NOT NULL,
  historia_origem VARCHAR(45)
);
