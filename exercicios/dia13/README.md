# Dia 13 — CTEs e agregações independentes

**Nível:** Intermediário

## O que será trabalhado

Divida consultas em etapas com WITH e teste cada CTE separadamente. Antes de juntar custos e paradas, agregue cada fato por equipamento para evitar multiplicação de valores. Calcule participações e qualidade de captura.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [071. Use CTE para produção boa diária, por dia.](exercicio_071.md)
- [072. Use CTE para mostrar equipamentos com mais de 1500 minutos de parada, por id.](exercicio_072.md)
- [073. Use CTE para calcular percentual de produção boa por turno, por turno.](exercicio_073.md)
- [074. Use duas CTEs para custos e paradas por equipamento sem multiplicar valores nos JOINs; inclua zeros.](exercicio_074.md)
- [075. Use CTE para taxa de qualidade não good por sensor, por id.](exercicio_075.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
