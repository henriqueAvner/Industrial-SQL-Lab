# Dia 6 — Agrupamentos por entidade

**Nível:** Intermediário

## O que será trabalhado

Use GROUP BY para resumir sensores, ordens, turnos e equipamentos. Identifique o que uma linha do resultado representa e filtre leituras confiáveis antes de calcular médias.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [035. Conte sensores por tipo, ordenando pelo tipo.](exercicio_035.md)
- [036. Conte ordens por status, ordenando pelo status.](exercicio_036.md)
- [037. Some produção boa por turno, ordenando pelo turno.](exercicio_037.md)
- [038. Some minutos de parada por equipamento, por id.](exercicio_038.md)
- [039. Calcule custo de manutenção por equipamento, por id.](exercicio_039.md)
- [040. Calcule média das leituras good por sensor, por id.](exercicio_040.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
