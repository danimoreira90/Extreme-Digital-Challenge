/*PROBLEMA 4
Neste problema, é necessário utilizar o máximo (MAX) da data de atualização (dt_atualizacao) para o subgrupo de pacientes que,
neste caso, compartilham o mesmo CPF, data de nascimento e nome da mãe. Após isso, juntamos a informação de volta
à tabela original para obter os pacientes com a data de atualização mais recente. Segue a query:*/

SELECT p.id, p.nome, p.dt_nascimento, p.cpf, p.nome_mae, p.dt_atualizacao
FROM stg_prontuario.PACIENTE p
INNER JOIN (
    SELECT cpf, dt_nascimento, nome_mae, MAX(dt_atualizacao) AS MaxDataAtualizacao
    FROM stg_prontuario.PACIENTE
    GROUP BY cpf, dt_nascimento, nome_mae
) AS latest ON p.cpf = latest.cpf 
             AND p.dt_nascimento = latest.dt_nascimento 
             AND p.nome_mae = latest.nome_mae 
             AND p.dt_atualizacao = latest.MaxDataAtualizacao;

/*Esta consulta retorna os registros de pacientes que, neste caso, possuem a data de atualização mais recente
dentro do subgrupo de duplicatas, como no exemplo:

Maria Clara com a data de atualização 27/07/2023 13:40:21 (porque é mais recente do que 02/05/2023 18:45:27).

Joao A. com a data de atualização 21/07/2023 14:50:31 (porque é mais recente do que 15/01/2023 16:45:22).*/
