use turmaBenner;

CREATE SCHEMA IF NOT EXISTS escola;

CREATE TABLE IF NOT EXISTS escola.escola(
    cd_escola INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    sg_escola VARCHAR(50) NOT NULL,
    nm_escola VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS escola.docente(
    cd_docente INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    sg_escola VARCHAR(50) NOT NULL,
    dt_admissao_docente DATE NOT NULL,
    cd_escola INT NOT NULL,
    FOREIGN KEY (cd_escola) REFERENCES
                    escola.escola(cd_escola)
);

CREATE TABLE IF NOT EXISTS escola.aluno(
    cd_matricula_aluno INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    nm_aluno VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS escola.disciplina(
    cd_disciplina INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    nm_disciplina VARCHAR(50) NOT NULL,
    cd_escola INT NOT NULL,
    FOREIGN KEY (cd_escola) REFERENCES
                    escola.escola(cd_escola)
);

CREATE TABLE IF NOT EXISTS escola.historico(
    cd_matricula_aluno INT NOT NULL,
    cd_disciplina INT NOT NULL,
    qt_nota_exame_final DECIMAL,
    FOREIGN KEY (cd_matricula_aluno) REFERENCES
                    escola.aluno(cd_matricula_aluno),
    FOREIGN KEY (cd_disciplina) REFERENCES
                    escola.disciplina(cd_disciplina)
);