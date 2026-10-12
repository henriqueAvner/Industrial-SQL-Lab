# Dia 20 — Análise mensal e relatório integrado

**Nível:** Avançado — consolidação

## O que será trabalhado

Compare produção mensal por fábrica e construa o relatório final por equipamento. Agregue produção, paradas e custos separadamente antes dos JOINs; preserve máquinas sem eventos, mantenha refugo NULL sem produção e calcule o ranking por fábrica. Explique os limites dos indicadores, sem inferir OEE.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [099. Calcule produção boa mensal e diferença contra mês anterior por fábrica.](exercicio_099.md)
- [100. Monte relatório final por equipamento: boas peças, refugo %, paradas não planejadas, custo e ranking de paradas por fábrica; inclua zeros e refugo NULL sem produção.](exercicio_100.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
