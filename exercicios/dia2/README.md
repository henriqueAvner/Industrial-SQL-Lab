# Dia 2 — Valores distintos, ausências e filtros combinados

**Nível:** Básico

## O que será trabalhado

Trabalhe DISTINCT, IS NULL, combinações de condições e intervalos de datas. Diferencie ausência de valor de zero e use limites de data semiabertos. Ordene custos com desempate por id.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [011. Liste cidades distintas alfabeticamente.](exercicio_011.md)
- [012. Liste produtos distintos alfabeticamente.](exercicio_012.md)
- [013. Liste manutenções sem responsável por id.](exercicio_013.md)
- [014. Liste leituras sem valor por id.](exercicio_014.md)
- [015. Liste manutenções ainda abertas por id.](exercicio_015.md)
- [016. Liste ordens de agosto por id usando intervalo semiaberto.](exercicio_016.md)
- [017. Liste leituras do sensor 1 de 1 a 7 de setembro inclusive, por horário.](exercicio_017.md)
- [018. Liste paradas não planejadas acima de 100 minutos por id.](exercicio_018.md)
- [019. Liste ordens abertas ou canceladas por id.](exercicio_019.md)
- [020. Mostre as dez manutenções mais caras; desempate por id.](exercicio_020.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
