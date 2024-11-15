/*PROBLEMA 2
Escreva um comando SQL que possa ser utilizado para copiar os dados
dos schemas dos hospitais para a nova tabela de pacientes que você
criou no schema stg_prontuario.*/

/*Utilizando apenas uma query para copiar os dados dos schemas de todos os hospitais para a nova 
tabela de pacientes no schema stg_prontuario, seria possível com o comando:*/

INSERT INTO stg_prontuario.PACIENTE (id, nome, dt_nascimento, cpf, nome_mae, dt_atualizacao)
SELECT id, nome, dt_nascimento, cpf, nome_mae, dt_atualizacao FROM stg_hospital_a.PACIENTE
UNION ALL
SELECT id, nome, dt_nascimento, cpf, nome_mae, dt_atualizacao FROM stg_hospital_b.PACIENTE
UNION ALL
SELECT id, nome, dt_nascimento, cpf, nome_mae, dt_atualizacao FROM stg_hospital_c.PACIENTE;

/*Porém, esta query é pesada em termos de desempenho pois o UNION ALL processa todas as tabelas antes de inseri-las.
Caso seja possível utilizar mais de uma query, podemos usar as seguintes queries para executar a tarefa:*/

-- Inserir dados do hospital A
INSERT INTO stg_prontuario.PACIENTE
SELECT id, nome, dt_nascimento, cpf, nome_mae, dt_atualizacao
FROM stg_hospital_a.PACIENTE;

-- Inserir dados do hospital B
INSERT INTO stg_prontuario.PACIENTE
SELECT id, nome, dt_nascimento, cpf, nome_mae, dt_atualizacao
FROM stg_hospital_b.PACIENTE;

-- Inserir dados do hospital C
INSERT INTO stg_prontuario.PACIENTE
SELECT id, nome, dt_nascimento, cpf, nome_mae, dt_atualizacao
FROM stg_hospital_c.PACIENTE;
