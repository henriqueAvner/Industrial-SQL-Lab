# Dia 19 — Seleção por ranking e grupos de capacidade

**Nível:** Avançado

## O que será trabalhado

Selecione até três máquinas por fábrica usando ROW_NUMBER, distribua capacidades com NTILE e preserve todas as manutenções empatadas no maior custo com DENSE_RANK. Observe a diferença entre quantidade fixa de posições e preservação de empates.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [094. Selecione até três equipamentos com mais paradas por fábrica em setembro; desempate por id usando ROW_NUMBER.](exercicio_094.md)
- [095. Separe equipamentos em quatro grupos por capacidade com NTILE, desempate por id.](exercicio_095.md)
- [098. Classifique custo das manutenções por equipamento com DENSE_RANK; mostre todas as maiores empatadas.](exercicio_098.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
