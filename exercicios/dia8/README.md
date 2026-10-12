# Dia 8 — Relacionamentos e entidades sem eventos

**Nível:** Intermediário

## O que será trabalhado

Percorra as chaves entre fábricas, linhas, equipamentos, sensores e responsáveis. Compare INNER JOIN e LEFT JOIN; preserve manutenções sem responsável e encontre máquinas sem manutenção.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [046. Liste linhas com o nome da fábrica, por id da linha.](exercicio_046.md)
- [047. Liste equipamentos com linha e fábrica, por id de equipamento.](exercicio_047.md)
- [048. Liste sensores com o nome do equipamento, por id do sensor.](exercicio_048.md)
- [049. Liste manutenções com o nome do responsável incluindo as sem responsável, por id.](exercicio_049.md)
- [050. Liste equipamentos sem manutenção, por id.](exercicio_050.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
