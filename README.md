# Industrial Operations SQL Lab — SQLite

## Comece aqui
1. Extraia todo o ZIP e abra **esta pasta** no VSCode (File → Open Folder).
2. O banco `industrial_operations.db` já está pronto. Python e Docker não são necessários para consultar pela extensão.
3. Instale **SQLTools** (mtxr.sqltools) e **SQLTools SQLite** (mtxr.sqltools-driver-sqlite).
4. No painel SQLTools escolha Add New Connection → SQLite; nome Industrial Lab; database/file: selecione o caminho absoluto do `.db`. Teste e salve a conexão. Se o driver solicitar instalação de dependência/Node, siga as instruções oficiais abaixo.
5. Expanda a conexão e Tables para visualizar tabelas/colunas. Abra `exercicios/minhas_respostas.sql`, selecione a conexão e execute apenas a consulta desejada usando Run Selected Query no menu da extensão.
6. Teste `SELECT COUNT(*) FROM sensor_readings;` (26.496 linhas) e `SELECT * FROM factories ORDER BY id;` (3 linhas).
7. Leia `docs/dicionario.md`; siga o [roteiro de 20 dias por assunto e dificuldade](exercicios/README.md). Cada pasta do dia contém orientações e um arquivo por exercício. A lista original permanece em `exercicios/100_exercicios.md`. Gabarito e amostras estão separados em `gabarito/`.

## Roteiro
| Faixa | Foco |
|---|---|
| 1–20 | SELECT, filtros, ordenação |
| 21–30 | Expressões, NULL, datas |
| 31–45 | GROUP BY, HAVING, agregações |
| 46–60 | JOINs, grãos e indicadores |
| 61–70 | Subconsultas e EXISTS |
| 71–80 | CTEs e CTE recursiva |
| 81–100 | ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, NTILE e frames |
Estude 3–4 conceitos por sessão; explique o resultado em linguagem de negócio antes de avançar. Não precisa completar tudo em um dia.

## Dicas
- NULL: IS NULL; divisão: use 100.0 e NULLIF. WHERE filtra linhas; HAVING filtra grupos.
- JOIN: identifique a chave e o grão. LEFT JOIN preserva entidades sem eventos.
- Subconsulta: produza primeiro o valor de comparação; EXISTS verifica existência sem duplicar.
- CTE: teste cada etapa isoladamente. Agregue fatos separadamente antes dos JOINs.
- Window: PARTITION BY separa grupos; ORDER BY ordena a janela, não a saída; o frame define quais linhas participam. O acumulado usa ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.
- Médias móveis de sete linhas só significam sete dias se há uma linha por dia sem lacunas. Neste conjunto, a produção diária possui esse calendário.
- Rankings preservam empates com RANK/DENSE_RANK; ROW_NUMBER com desempate produz exatamente até N linhas.

## Alternativa DBeaver
Nova conexão → SQLite → selecione o mesmo `.db` → finalize. Expanda Tables; abra uma tabela e a aba Data; abra um SQL Editor para consultar. Não é necessário servidor.

## Recriar e verificar
Python 3.11+ (somente biblioteca padrão): `python scripts/create_database.py`.
O script recusa sobrescrever um banco existente: faça backup/renomeie-o primeiro. A seed é 42 e não usa a data atual.
`python scripts/verify_lab.py` executa os 100 gabaritos e confere integridade, FKs, colunas, contagens e primeiras linhas esperadas. Isso valida o material, não compara automaticamente suas respostas.

## Portfólio
Versione README, scripts, schema e respostas. O `.db` pequeno pode ser versionado como dataset didático; não envie credenciais ou dados reais. Registre cinco descobertas em `docs/minhas_analises.md` e explique os limites dos indicadores.

## Documentação consultada
- SQLTools: https://vscode-sqltools.mteixeira.dev/
- Driver SQLite: https://vscode-sqltools.mteixeira.dev/en/drivers/sq-lite.html
- SQLite Window Functions: https://www.sqlite.org/windowfunctions.html
