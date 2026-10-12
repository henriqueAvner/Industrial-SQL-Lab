# Dia 3 — Cálculos e classificação de registros

**Nível:** Básico

## O que será trabalhado

Construa colunas calculadas, percentuais, conversões de unidades e classificações com CASE. Use divisão decimal e NULLIF para denominadores zero; COALESCE permite apresentar valores ausentes.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [021. Calcule produção total de cada registro: boas mais refugos, por id.](exercicio_021.md)
- [022. Calcule percentual de refugos de cada registro com duas casas, por id.](exercicio_022.md)
- [023. Converta duração de cada parada em horas com duas casas, por id.](exercicio_023.md)
- [024. Exiba id de manutenção e responsável; use Sem responsável para NULL.](exercicio_024.md)
- [025. Classifique paradas: longa se >=120 minutos, curta caso contrário; por id.](exercicio_025.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
