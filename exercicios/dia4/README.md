# Dia 4 — Funções de texto e datas

**Nível:** Básico

## O que será trabalhado

Extraia mês, dia e hora, transforme textos e calcule durações entre datas. Pratique as funções de SQLite, como substr, date, strftime e julianday, e trate NULL antes de classificar leituras.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [026. Extraia mês YYYY-MM das ordens; mostre id e mês por id.](exercicio_026.md)
- [027. Mostre tag dos sensores em minúsculas, por id.](exercicio_027.md)
- [028. Calcule duração em horas das manutenções encerradas com duas casas.](exercicio_028.md)
- [029. Classifique leituras do sensor 1: ausente, acima de 90 ou normal; por id.](exercicio_029.md)
- [030. Mostre dia e hora das primeiras 20 leituras por id.](exercicio_030.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
