# Dia 17 — Comparações entre registros consecutivos

**Nível:** Avançado

## O que será trabalhado

Use LAG e LEAD para consultar registros anteriores e seguintes. Calcule variações absolutas, percentuais e intervalos entre leituras; mantenha NULL no primeiro registro e proteja divisões por zero.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [087. Mostre produção boa diária e do dia anterior com LAG.](exercicio_087.md)
- [088. Calcule variação absoluta da produção boa diária contra o dia anterior.](exercicio_088.md)
- [089. Calcule variação percentual da produção boa diária; primeiro dia NULL.](exercicio_089.md)
- [090. Mostre próxima leitura e valor do sensor 1 com LEAD.](exercicio_090.md)
- [097. Calcule intervalo em horas entre leituras de cada sensor com LAG; primeiro NULL.](exercicio_097.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
