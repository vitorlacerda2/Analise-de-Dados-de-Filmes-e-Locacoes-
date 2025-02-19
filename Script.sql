SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

-- CASE1; Estamos fazendo uma análise para descobrir o preço médio dos alugueis de filmes.

SELECT AVG(preco_aluguel) FROM filmes;

-- CASE2; Agora com o preço médio do aluguel de filmes, vamos análisar e descobrir qual é o preço médio de cada gênero de filme.

SELECT 
	genero,
    ROUND(AVG(preco_aluguel), 2) AS preco_medio,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;

-- CASE3; Pegar a mesma análise mas agora vamos apenas considerar os filmes lançados em um ano especifico.

SELECT 
	genero,
    ROUND(AVG(preco_aluguel), 2) AS preco_medio,
    COUNT(*) AS qtd_filmes
FROM filmes
WHERE ano_lancamento = 2011
GROUP BY genero;

-- CASE4; Faremos uma análise de desempenho de alugueis e nromalmente o comum é pegar notasa acima da média para avaliarmos.

SELECT AVG(nota) FROM alugueis; -- 7.94

-- Lado interessante de fazer das duas forma pq a 1 pega a media de todos que já existem, a 2 pega a nota dos filmes mesmo se atualizar e pegamos filmes com média acima de 7.94.

SELECT *
FROM alugueis
WHERE nota >= (SELECT AVG(nota) FROM alugueis);

-- Vamos agora salvar a(s) tabela(s) no banco de dados.

CREATE VIEW resultado AS 
SELECT
	genero,
    ROUND(AVG(preco_aluguel), 2) AS media_preco,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;

SELECT * FROM resultado; -- Para apagar damos o comando DROP VIEW