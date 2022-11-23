use turmaBenner;

CREATE SCHEMA IF NOT EXISTS padaria;

CREATE TABLE IF NOT EXISTS padaria.fornecedor(
    cd_fornecedor INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    nm_fornecedor VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS padaria.materiaPrima(
    cd_materia_prima INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    nm_materia_prima VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS padaria.fornecimento(
    cd_materia_prima INT NOT NULL,
    cd_fornecedor INT NOT NULL,
    FOREIGN KEY(cd_materia_prima) REFERENCES
                    padaria.materiaPrima(cd_materia_prima),
    FOREIGN KEY (cd_fornecedor) REFERENCES
                    padaria.fornecedor(cd_fornecedor)
);

CREATE TABLE IF NOT EXISTS padaria.filial(
    cd_filial INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    nm_filial VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS padaria.forno(
    cd_forno INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    qt_producao_forno DECIMAL,
    cd_filial INT NOT NULL,
    FOREIGN KEY (cd_filial) REFERENCES
                    padaria.filial(cd_filial)
);

CREATE TABLE IF NOT EXISTS padaria.tipoProduto(
    cd_tipo_produto INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    nm_produto VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS padaria.produto(
    cd_forno INT NOT NULL,
    cd_tipo_produto INT NOT NULL,
    dt_producao DATE NOT NULL,
    dt_validade DATE NOT NULL,
    FOREIGN KEY (cd_forno) REFERENCES
                    padaria.forno(cd_forno),
    FOREIGN KEY (cd_tipo_produto) REFERENCES
                    padaria.tipoProduto(cd_tipo_produto),
    PRIMARY KEY (cd_forno, cd_tipo_produto, dt_producao)
);

CREATE TABLE IF NOT EXISTS padaria.receita(
    cd_tipo_produto INT NOT NULL,
    cd_materia_prima INT NOT NULL,
    qt_materia_prima DECIMAL NOT NULL,
    FOREIGN KEY (cd_materia_prima) REFERENCES
                    padaria.materiaPrima(cd_materia_prima),
    FOREIGN KEY (cd_tipo_produto) REFERENCES
                    padaria.tipoProduto(cd_tipo_produto),
    PRIMARY KEY (cd_tipo_produto, cd_materia_prima)
);