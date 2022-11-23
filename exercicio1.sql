use turmaBenner;

CREATE SCHEMA IF NOT EXISTS despachante;

CREATE TABLE IF NOT EXISTS despachante.proprietario(
    cd_cpf_proprietario VARCHAR(11) NOT NULL PRIMARY KEY,
    nm_proprietario VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS despachante.veiculo(
    cd_veiculo VARCHAR(17) NOT NULL PRIMARY KEY,
    nm_veiculo VARCHAR(50) NOT NULL,
    cd_cpf_proprietario VARCHAR(11) NOT NULL,
    FOREIGN KEY (cd_cpf_proprietario) REFERENCES 
                    despachante.proprietario(cd_cpf_proprietario)
);

CREATE TABLE IF NOT EXISTS despachante.licenciamento(
    cd_veiculo VARCHAR(17) NOT NULL,
    dt_licenciamento DATE NOT NULL,
    vl_licenciamento MONEY NOT NULL,
    FOREIGN KEY (cd_veiculo) REFERENCES
                    despachante.veiculo(cd_veiculo),
    PRIMARY KEY (cd_veiculo, dt_licenciamento)
);