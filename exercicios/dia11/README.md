# Dia 11 — Subconsultas e testes de existência

**Nível:** Intermediário

## O que será trabalhado

Compare valores com médias globais e médias da própria linha. Use EXISTS e NOT EXISTS para verificar eventos sem multiplicar entidades no resultado; identifique consultas correlacionadas.

## Como estudar

1. Revise as tabelas e regras no [dicionário de dados](../../docs/dicionario.md).
2. Leia os enunciados abaixo e escreva as consultas nos espaços correspondentes de [minhas_respostas.sql](../minhas_respostas.sql).
3. Execute uma consulta por vez no banco industrial_operations.db e confira colunas, quantidade de linhas e ordenação.
4. Explique o resultado em linguagem de negócio e suas limitações. Quantidade de linhas igual à esperada não prova correção.
5. Após tentar, consulte o [gabarito](../../gabarito/solucoes.sql).

## Exercícios do dia

- [061. Liste manutenções com custo acima da média global, por id.](exercicio_061.md)
- [062. Liste equipamentos com alguma manutenção corretiva usando EXISTS, por id.](exercicio_062.md)
- [063. Liste equipamentos sem paradas usando NOT EXISTS, por id.](exercicio_063.md)
- [064. Liste equipamentos cuja capacidade supera a média da própria linha, por id.](exercicio_064.md)
- [065. Liste sensores que já registraram valor good acima do limite, por id.](exercicio_065.md)

## Ao concluir

Você deve conseguir explicar os conceitos do dia, justificar os filtros e relacionamentos usados e interpretar valores NULL, zeros ou resultados vazios quando aparecerem.

[Voltar ao roteiro](../README.md)
