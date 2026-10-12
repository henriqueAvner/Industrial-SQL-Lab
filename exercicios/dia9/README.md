# Dia 9 — Indicadores com JOINs

**Nível:** Intermediário

## O que será trabalhado

Agregue produção e manutenção por máquina ou fábrica e examine limites de sensores. Defina o nível de cada resultado, use COALESCE quando zero fizer sentido e diferencie captura good de operação dentro do limite.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [051. Conte equipamentos por fábrica, por id da fábrica.](exercicio_051.md)
- [052. Some produção boa por equipamento incluindo zero para quem não produziu, por id.](exercicio_052.md)
- [053. Calcule média de temperatura good por equipamento, por id.](exercicio_053.md)
- [054. Liste leituras good fora dos limites do próprio sensor, por id da leitura.](exercicio_054.md)
- [055. Some custo de manutenção por fábrica, por id da fábrica.](exercicio_055.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
