/*PROBLEMA 3
Escreva uma consulta em SQL que retorne os pacientes duplicados na
tabela PACIENTE do schema stg_prontuario, caso existam.*/

SELECT cpf, COUNT(*) AS quantidade
FROM stg_prontuario.PACIENTE
GROUP BY cpf, dt_nascimento, nome_mae
HAVING COUNT(*) > 1;
