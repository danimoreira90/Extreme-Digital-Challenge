/* PROBLEMA 1
Escreva um comando SQL que crie uma
tabela chamada PACIENTE, no schema stg_prontuario, para abrigar os
dados de pacientes de todos os hospitais.*/

CREATE TABLE stg_prontuario.PACIENTE (
    id INT,
    nome VARCHAR(255),
    dt_nascimento DATE,
    cpf INT,
    nome_mae VARCHAR(255),
    dt_atualizacao TIMESTAMP
);
