# Dia 15 — Introdução a rankings e partições

**Nível:** Avançado — introdução

## O que será trabalhado

Pratique ROW_NUMBER, RANK e DENSE_RANK. Compare tratamento de empates, use PARTITION BY para reiniciar cálculos por grupo e selecione a leitura mais recente de cada sensor com desempate determinístico.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [081. Numere equipamentos por capacidade decrescente com ROW_NUMBER; desempate por id.](exercicio_081.md)
- [082. Classifique capacidades dentro de cada linha com RANK; ordene linha e posição.](exercicio_082.md)
- [083. Use DENSE_RANK para custos totais de manutenção por equipamento, maior primeiro.](exercicio_083.md)
- [084. Encontre a leitura mais recente de cada sensor com ROW_NUMBER, por sensor.](exercicio_084.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
