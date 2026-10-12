# Dia 18 — Médias móveis e limites de janela

**Nível:** Avançado

## O que será trabalhado

Defina frames para médias móveis e para FIRST_VALUE e LAST_VALUE. Sete linhas representam sete dias somente quando existe uma linha por dia sem lacunas; AVG ignora NULL. Use frame completo para buscar o último valor de toda a série.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [091. Calcule média móvel de sete dias da produção boa diária; início usa dias disponíveis.](exercicio_091.md)
- [092. Calcule média móvel das quatro últimas leituras do sensor 1 incluindo atual; AVG ignora NULL.](exercicio_092.md)
- [096. Mostre primeira e última leitura do sensor 1 em todas as linhas usando frame completo.](exercicio_096.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
