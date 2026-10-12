# Dicionário e regras de negócio

Dados sintéticos determinísticos (seed 42), nunca dados da empresa. Período 01/07/2026 a 30/09/2026. Horários UTC sem sufixo, no formato YYYY-MM-DD HH:MM:SS. IDs são chaves substitutas.

| Tabela | Linhas | Colunas (tipo, obrigatoriedade e FK no schema SQL) |
|---|---:|---|
| downtime_events | 223 | id: INTEGER; equipment_id: INTEGER; started_at: TEXT; duration_minutes: INTEGER; planned: INTEGER; reason: TEXT |
| employees | 12 | id: INTEGER; factory_id: INTEGER; name: TEXT; role: TEXT |
| equipment | 18 | id: INTEGER; line_id: INTEGER; name: TEXT; installed_on: TEXT; status: TEXT; capacity_per_hour: REAL |
| factories | 3 | id: INTEGER; name: TEXT; city: TEXT |
| maintenance_orders | 105 | id: INTEGER; equipment_id: INTEGER; employee_id: INTEGER; kind: TEXT; opened_at: TEXT; closed_at: TEXT; cost: REAL; description: TEXT |
| production_lines | 6 | id: INTEGER; factory_id: INTEGER; name: TEXT |
| production_orders | 1564 | id: INTEGER; equipment_id: INTEGER; product: TEXT; planned_qty: INTEGER; due_date: TEXT; status: TEXT |
| production_records | 4443 | id: INTEGER; order_id: INTEGER; recorded_at: TEXT; shift: TEXT; good_qty: INTEGER; scrap_qty: INTEGER; operating_minutes: INTEGER |
| sensor_readings | 26496 | id: INTEGER; sensor_id: INTEGER; measured_at: TEXT; value: REAL; quality: TEXT |
| sensors | 72 | id: INTEGER; equipment_id: INTEGER; tag: TEXT; kind: TEXT; unit: TEXT; min_value: REAL; max_value: REAL |

## Grãos e medidas
- factories: uma unidade; production_lines: uma linha pertencente a uma unidade; equipment: uma máquina de uma linha.
- sensors: uma tag por equipamento e grandeza; sensor_readings: uma leitura por sensor e instante (quatro por dia). value é uma medida instantânea. Não some temperatura, pressão ou potência como se fossem quantidades produzidas. energy em kW é potência, não consumo acumulado em kWh.
- employees: um funcionário de uma fábrica; maintenance_orders: uma ordem com responsável opcional, custo em BRL, abertura e encerramento opcional. kind indica preventiva/corretiva.
- production_orders: uma ordem por equipamento e dia para 17 máquinas; planned_qty é a meta de peças, due_date a data alvo. Ordens abertas/canceladas não têm registros.
- production_records: um registro por ordem e turno A/B/C (inícios 00h/08h/16h); good_qty e scrap_qty são peças distintas; operating_minutes é o tempo de operação daquele registro.
- downtime_events: um evento por equipamento/instante; duração em minutos; planned=1 indica parada planejada. Eventos e produção são simulações independentes; não inferir OEE ou disponibilidade física sem calendário e reconciliação de intervalos.
- quality=missing implica value NULL; bad indica leitura não confiável. good indica qualidade de captura e pode estar fora do limite operacional (anomalia). Limites são inclusivos.
- Máquina 18 está inativa, tem sensores, mas não tem produção/manutenção/paradas. Máquina 4 apresenta mais refugos, paradas e temperatura elevada em setembro.
- Refugo ponderado = SUM(scrap_qty)/SUM(good_qty+scrap_qty), nunca média de percentuais individuais. Divisão sem denominador deve retornar NULL.
- Datas são textos ISO; use intervalos semiabertos. SQLite não possui DATE_TRUNC: use date/strftime/substr. AVG ignora NULL.
- Antes de juntar duas tabelas de fatos, agregue cada uma no mesmo grão para evitar multiplicação de valores.

## Relacionamentos
factories → production_lines → equipment → sensors → sensor_readings.
equipment → production_orders → production_records.
equipment → maintenance_orders e downtime_events; factories → employees → maintenance_orders.
O schema SQL contém todas as CHECKs, FKs e índices. PRAGMA foreign_keys deve ser ativado em cada conexão que escrever.
