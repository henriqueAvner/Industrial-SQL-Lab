# Dia 12 — Comparações por entidade e ausência de dados

**Nível:** Intermediário

## O que será trabalhado

Compare produção com metas, encontre máximos preservando empates e investigue entidades sem eventos. Nas subconsultas correlacionadas, confira se a comparação usa o equipamento correto e se ausência de produção deve virar zero.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [066. Liste ordens com produção boa total abaixo da meta incluindo zero, por id.](exercicio_066.md)
- [067. Liste todas as manutenções de custo máximo, incluindo empates, por id.](exercicio_067.md)
- [068. Liste sensores sem leituras usando NOT EXISTS, por id.](exercicio_068.md)
- [069. Liste fábricas com algum equipamento inativo usando EXISTS, por id.](exercicio_069.md)
- [070. Liste manutenções com custo acima da média do próprio equipamento, por id.](exercicio_070.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
