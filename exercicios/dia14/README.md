# Dia 14 — CTEs temporais e calendário recursivo

**Nível:** Intermediário

## O que será trabalhado

Construa indicadores mensais, taxas diárias, conclusão de ordens e contagens de anomalias. Use uma CTE recursiva para gerar o calendário de setembro, incluindo dias sem dados, e explique resultados vazios.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [076. Use CTE para produção boa mensal por fábrica, ordenando fábrica e mês.](exercicio_076.md)
- [077. Use CTE para refugo diário acima de 8%, por dia.](exercicio_077.md)
- [078. Use CTE para percentual de ordens concluídas por equipamento, por id.](exercicio_078.md)
- [079. Use CTE para contar anomalias good por tipo de sensor, por tipo.](exercicio_079.md)
- [080. Use CTE recursiva para listar todos os dias de setembro, inclusive dias sem dados.](exercicio_080.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
