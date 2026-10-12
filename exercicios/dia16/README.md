# Dia 16 — Acumulados e participação no total

**Nível:** Avançado

## O que será trabalhado

Calcule acumulados diários e por equipamento com SUM OVER e frame ROWS explícito. Compare uma janela ordenada de acumulação com uma janela do total geral. A ordenação da janela não substitui ORDER BY na saída.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [085. Calcule produção boa acumulada diária de agosto com frame ROWS explícito.](exercicio_085.md)
- [086. Calcule minutos de parada acumulados por equipamento e evento; desempate por id.](exercicio_086.md)
- [093. Calcule participação de cada equipamento no total de minutos de parada usando SUM OVER.](exercicio_093.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
