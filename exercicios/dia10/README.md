# Dia 10 — Qualidade e consistência relacional

**Nível:** Intermediário

## O que será trabalhado

Analise paradas não planejadas, ordens sem produção, refugo por produto e leituras ausentes. Calcule refugo pela razão entre somas e interprete resultados vazios, como a ausência de responsáveis de outra fábrica.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [056. Some minutos de parada não planejada por linha, por id.](exercicio_056.md)
- [057. Liste ordens sem registros de produção, por id.](exercicio_057.md)
- [058. Calcule refugo percentual ponderado por produto, por produto.](exercicio_058.md)
- [059. Mostre manutenções cujo responsável pertence a outra fábrica, por id.](exercicio_059.md)
- [060. Calcule quantidade de leituras missing por fábrica, por id.](exercicio_060.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
