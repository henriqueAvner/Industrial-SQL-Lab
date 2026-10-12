# 100 exercícios SQL

Todos usam a base original (julho a setembro de 2026). Não altere os dados. Formato e contagem ajudam a verificar, mas não provam correção. Dicas gerais estão no README; tente antes de abrir o gabarito.

## SELECT e filtros

### 001. Liste todas as fábricas por id.

**Nível:** básico · **Tabelas:** factories

**Formato esperado:** `id, name, city`. **Quantidade:** 3 linhas. 

### 002. Mostre nome e cidade das fábricas por nome.

**Nível:** básico · **Tabelas:** factories

**Formato esperado:** `name, city`. **Quantidade:** 3 linhas. 

### 003. Liste equipamentos por id.

**Nível:** básico · **Tabelas:** equipment

**Formato esperado:** `id, line_id, name, installed_on, status, capacity_per_hour`. **Quantidade:** 18 linhas. 

### 004. Mostre os equipamentos ativos por id.

**Nível:** básico · **Tabelas:** equipment

**Formato esperado:** `id, name`. **Quantidade:** 17 linhas. 

### 005. Mostre os equipamentos inativos por id.

**Nível:** básico · **Tabelas:** equipment

**Formato esperado:** `id, name`. **Quantidade:** 1 linhas. 

### 006. Liste equipamentos com capacidade superior a 140, por id.

**Nível:** básico · **Tabelas:** equipment

**Formato esperado:** `id, capacity_per_hour`. **Quantidade:** 6 linhas. 

### 007. Liste sensores de temperatura por id.

**Nível:** básico · **Tabelas:** sensors

**Formato esperado:** `id, tag`. **Quantidade:** 18 linhas. 

### 008. Liste sensores de pressão ou vibração por id usando IN.

**Nível:** básico · **Tabelas:** sensors

**Formato esperado:** `id, tag, kind`. **Quantidade:** 36 linhas. 

### 009. Liste técnicos cujo nome termina em 1, por id.

**Nível:** básico · **Tabelas:** employees

**Formato esperado:** `id, factory_id, name, role`. **Quantidade:** 2 linhas. 

### 010. Mostre as cinco primeiras leituras por id.

**Nível:** básico · **Tabelas:** sensor_readings

**Formato esperado:** `id, sensor_id, measured_at, value, quality`. **Quantidade:** 5 linhas. 

### 011. Liste cidades distintas alfabeticamente.

**Nível:** básico · **Tabelas:** factories

**Formato esperado:** `city`. **Quantidade:** 3 linhas. 

### 012. Liste produtos distintos alfabeticamente.

**Nível:** básico · **Tabelas:** production_orders

**Formato esperado:** `product`. **Quantidade:** 3 linhas. 

### 013. Liste manutenções sem responsável por id.

**Nível:** básico · **Tabelas:** maintenance_orders

**Formato esperado:** `id, equipment_id, employee_id, kind, opened_at, closed_at, cost, description`. **Quantidade:** 19 linhas. 

### 014. Liste leituras sem valor por id.

**Nível:** básico · **Tabelas:** sensor_readings

**Formato esperado:** `id, sensor_id, measured_at, value, quality`. **Quantidade:** 283 linhas. 

### 015. Liste manutenções ainda abertas por id.

**Nível:** básico · **Tabelas:** maintenance_orders

**Formato esperado:** `id, equipment_id, employee_id, kind, opened_at, closed_at, cost, description`. **Quantidade:** 7 linhas. 

### 016. Liste ordens de agosto por id usando intervalo semiaberto.

**Nível:** básico · **Tabelas:** production_orders

**Formato esperado:** `id, equipment_id, product, planned_qty, due_date, status`. **Quantidade:** 527 linhas. 

### 017. Liste leituras do sensor 1 de 1 a 7 de setembro inclusive, por horário.

**Nível:** básico · **Tabelas:** sensor_readings

**Formato esperado:** `id, sensor_id, measured_at, value, quality`. **Quantidade:** 28 linhas. 

### 018. Liste paradas não planejadas acima de 100 minutos por id.

**Nível:** básico · **Tabelas:** downtime_events

**Formato esperado:** `id, equipment_id, started_at, duration_minutes, planned, reason`. **Quantidade:** 29 linhas. 

### 019. Liste ordens abertas ou canceladas por id.

**Nível:** básico · **Tabelas:** production_orders

**Formato esperado:** `id, equipment_id, product, planned_qty, due_date, status`. **Quantidade:** 83 linhas. 

### 020. Mostre as dez manutenções mais caras; desempate por id.

**Nível:** básico · **Tabelas:** maintenance_orders

**Formato esperado:** `id, cost`. **Quantidade:** 10 linhas. 

## Expressões, NULL e datas

### 021. Calcule produção total de cada registro: boas mais refugos, por id.

**Nível:** básico · **Tabelas:** production_records

**Formato esperado:** `id, total_qty`. **Quantidade:** 4443 linhas. 

### 022. Calcule percentual de refugos de cada registro com duas casas, por id.

**Nível:** básico · **Tabelas:** production_records

**Formato esperado:** `id, scrap_pct`. **Quantidade:** 4443 linhas. 

### 023. Converta duração de cada parada em horas com duas casas, por id.

**Nível:** básico · **Tabelas:** downtime_events

**Formato esperado:** `id, hours`. **Quantidade:** 223 linhas. 

### 024. Exiba id de manutenção e responsável; use Sem responsável para NULL.

**Nível:** básico · **Tabelas:** maintenance_orders

**Formato esperado:** `id, responsible`. **Quantidade:** 105 linhas. 

### 025. Classifique paradas: longa se >=120 minutos, curta caso contrário; por id.

**Nível:** básico · **Tabelas:** downtime_events

**Formato esperado:** `id, category`. **Quantidade:** 223 linhas. 

### 026. Extraia mês YYYY-MM das ordens; mostre id e mês por id.

**Nível:** básico · **Tabelas:** production_orders

**Formato esperado:** `id, month`. **Quantidade:** 1564 linhas. 

### 027. Mostre tag dos sensores em minúsculas, por id.

**Nível:** básico · **Tabelas:** sensors

**Formato esperado:** `id, tag`. **Quantidade:** 72 linhas. 

### 028. Calcule duração em horas das manutenções encerradas com duas casas.

**Nível:** básico · **Tabelas:** maintenance_orders

**Formato esperado:** `id, hours`. **Quantidade:** 98 linhas. 

### 029. Classifique leituras do sensor 1: ausente, acima de 90 ou normal; por id.

**Nível:** básico · **Tabelas:** sensor_readings

**Formato esperado:** `id, category`. **Quantidade:** 368 linhas. 

### 030. Mostre dia e hora das primeiras 20 leituras por id.

**Nível:** básico · **Tabelas:** sensor_readings

**Formato esperado:** `id, day, hour`. **Quantidade:** 20 linhas. 

## Agregações

### 031. Conte todos os equipamentos.

**Nível:** intermediário · **Tabelas:** equipment

**Formato esperado:** `equipment_count`. **Quantidade:** 1 linhas. 

### 032. Conte leituras e valores não nulos.

**Nível:** intermediário · **Tabelas:** sensor_readings

**Formato esperado:** `readings, non_null_values`. **Quantidade:** 1 linhas. 

### 033. Calcule mínimo, máximo e média dos custos de manutenção.

**Nível:** intermediário · **Tabelas:** maintenance_orders

**Formato esperado:** `minimum, maximum, average`. **Quantidade:** 1 linhas. 

### 034. Some boas peças e refugos de toda a produção.

**Nível:** intermediário · **Tabelas:** production_records

**Formato esperado:** `good, scrap`. **Quantidade:** 1 linhas. 

### 035. Conte sensores por tipo, ordenando pelo tipo.

**Nível:** intermediário · **Tabelas:** sensors

**Formato esperado:** `kind, sensors`. **Quantidade:** 4 linhas. 

### 036. Conte ordens por status, ordenando pelo status.

**Nível:** intermediário · **Tabelas:** production_orders

**Formato esperado:** `status, orders`. **Quantidade:** 3 linhas. 

### 037. Some produção boa por turno, ordenando pelo turno.

**Nível:** intermediário · **Tabelas:** production_records

**Formato esperado:** `shift, good`. **Quantidade:** 3 linhas. 

### 038. Some minutos de parada por equipamento, por id.

**Nível:** intermediário · **Tabelas:** equipment, downtime_events

**Formato esperado:** `equipment_id, minutes`. **Quantidade:** 17 linhas. 

### 039. Calcule custo de manutenção por equipamento, por id.

**Nível:** intermediário · **Tabelas:** equipment, maintenance_orders

**Formato esperado:** `equipment_id, cost`. **Quantidade:** 17 linhas. 

### 040. Calcule média das leituras good por sensor, por id.

**Nível:** intermediário · **Tabelas:** sensor_readings

**Formato esperado:** `sensor_id, average`. **Quantidade:** 72 linhas. 

### 041. Mostre equipamentos com mais de 1500 minutos de parada, por id.

**Nível:** intermediário · **Tabelas:** equipment, downtime_events

**Formato esperado:** `equipment_id, minutes`. **Quantidade:** 1 linhas. 

### 042. Mostre sensores com mais de três valores ausentes, por id.

**Nível:** intermediário · **Tabelas:** sensor_readings

**Formato esperado:** `sensor_id, missing`. **Quantidade:** 67 linhas. 

### 043. Some custo por tipo de manutenção, por tipo.

**Nível:** intermediário · **Tabelas:** maintenance_orders

**Formato esperado:** `kind, cost`. **Quantidade:** 2 linhas. 

### 044. Calcule produção boa diária em agosto, por dia.

**Nível:** intermediário · **Tabelas:** production_records

**Formato esperado:** `day, good`. **Quantidade:** 31 linhas. 

### 045. Conte paradas por mês, ordenando mês.

**Nível:** intermediário · **Tabelas:** downtime_events

**Formato esperado:** `month, events`. **Quantidade:** 3 linhas. 

## JOINs e análise relacional

### 046. Liste linhas com o nome da fábrica, por id da linha.

**Nível:** intermediário · **Tabelas:** factories, production_lines

**Formato esperado:** `id, name, factory`. **Quantidade:** 6 linhas. 

### 047. Liste equipamentos com linha e fábrica, por id de equipamento.

**Nível:** intermediário · **Tabelas:** factories, production_lines, equipment

**Formato esperado:** `id, name, line, factory`. **Quantidade:** 18 linhas. 

### 048. Liste sensores com o nome do equipamento, por id do sensor.

**Nível:** intermediário · **Tabelas:** equipment, sensors

**Formato esperado:** `id, tag, name`. **Quantidade:** 72 linhas. 

### 049. Liste manutenções com o nome do responsável incluindo as sem responsável, por id.

**Nível:** intermediário · **Tabelas:** employees, maintenance_orders

**Formato esperado:** `id, name`. **Quantidade:** 105 linhas. 

### 050. Liste equipamentos sem manutenção, por id.

**Nível:** intermediário · **Tabelas:** equipment, maintenance_orders

**Formato esperado:** `id, name`. **Quantidade:** 1 linhas. 

### 051. Conte equipamentos por fábrica, por id da fábrica.

**Nível:** intermediário · **Tabelas:** factories, production_lines, equipment

**Formato esperado:** `id, name, equipment_count`. **Quantidade:** 3 linhas. 

### 052. Some produção boa por equipamento incluindo zero para quem não produziu, por id.

**Nível:** intermediário · **Tabelas:** equipment, production_orders, production_records

**Formato esperado:** `id, good`. **Quantidade:** 18 linhas. 

### 053. Calcule média de temperatura good por equipamento, por id.

**Nível:** intermediário · **Tabelas:** equipment, sensors, sensor_readings

**Formato esperado:** `id, temperature`. **Quantidade:** 18 linhas. 

### 054. Liste leituras good fora dos limites do próprio sensor, por id da leitura.

**Nível:** intermediário · **Tabelas:** sensors, sensor_readings

**Formato esperado:** `id, tag, value, min_value, max_value`. **Quantidade:** 389 linhas. 

### 055. Some custo de manutenção por fábrica, por id da fábrica.

**Nível:** intermediário · **Tabelas:** factories, production_lines, equipment, maintenance_orders

**Formato esperado:** `id, cost`. **Quantidade:** 3 linhas. 

### 056. Some minutos de parada não planejada por linha, por id.

**Nível:** intermediário · **Tabelas:** production_lines, equipment, downtime_events

**Formato esperado:** `id, minutes`. **Quantidade:** 6 linhas. 

### 057. Liste ordens sem registros de produção, por id.

**Nível:** intermediário · **Tabelas:** production_orders, production_records

**Formato esperado:** `id, status`. **Quantidade:** 83 linhas. 

### 058. Calcule refugo percentual ponderado por produto, por produto.

**Nível:** intermediário · **Tabelas:** production_orders, production_records

**Formato esperado:** `product, scrap_pct`. **Quantidade:** 3 linhas. 

### 059. Mostre manutenções cujo responsável pertence a outra fábrica, por id.

**Nível:** intermediário · **Tabelas:** production_lines, equipment, employees, maintenance_orders

**Formato esperado:** `id`. **Quantidade:** 0 linhas. Resultado vazio intencional: explique o que ele demonstra.

### 060. Calcule quantidade de leituras missing por fábrica, por id.

**Nível:** intermediário · **Tabelas:** factories, production_lines, equipment, sensors, sensor_readings

**Formato esperado:** `id, missing`. **Quantidade:** 3 linhas. 

## Subconsultas

### 061. Liste manutenções com custo acima da média global, por id.

**Nível:** intermediário · **Tabelas:** maintenance_orders

**Formato esperado:** `id, cost`. **Quantidade:** 50 linhas. 

### 062. Liste equipamentos com alguma manutenção corretiva usando EXISTS, por id.

**Nível:** intermediário · **Tabelas:** equipment, maintenance_orders

**Formato esperado:** `id, name`. **Quantidade:** 12 linhas. 

### 063. Liste equipamentos sem paradas usando NOT EXISTS, por id.

**Nível:** intermediário · **Tabelas:** equipment, downtime_events

**Formato esperado:** `id`. **Quantidade:** 1 linhas. 

### 064. Liste equipamentos cuja capacidade supera a média da própria linha, por id.

**Nível:** intermediário · **Tabelas:** equipment

**Formato esperado:** `id, capacity_per_hour`. **Quantidade:** 6 linhas. 

### 065. Liste sensores que já registraram valor good acima do limite, por id.

**Nível:** intermediário · **Tabelas:** sensors, sensor_readings

**Formato esperado:** `id, tag`. **Quantidade:** 72 linhas. 

### 066. Liste ordens com produção boa total abaixo da meta incluindo zero, por id.

**Nível:** intermediário · **Tabelas:** production_orders, production_records

**Formato esperado:** `id, planned_qty, good`. **Quantidade:** 1526 linhas. 

### 067. Liste todas as manutenções de custo máximo, incluindo empates, por id.

**Nível:** intermediário · **Tabelas:** maintenance_orders

**Formato esperado:** `id, cost`. **Quantidade:** 1 linhas. 

### 068. Liste sensores sem leituras usando NOT EXISTS, por id.

**Nível:** intermediário · **Tabelas:** sensors, sensor_readings

**Formato esperado:** `id`. **Quantidade:** 0 linhas. Resultado vazio intencional: explique o que ele demonstra.

### 069. Liste fábricas com algum equipamento inativo usando EXISTS, por id.

**Nível:** intermediário · **Tabelas:** factories, production_lines, equipment

**Formato esperado:** `id`. **Quantidade:** 1 linhas. 

### 070. Liste manutenções com custo acima da média do próprio equipamento, por id.

**Nível:** intermediário · **Tabelas:** equipment, maintenance_orders

**Formato esperado:** `id, cost`. **Quantidade:** 47 linhas. 

## CTEs

### 071. Use CTE para produção boa diária, por dia.

**Nível:** intermediário · **Tabelas:** production_records

**Formato esperado:** `day, good`. **Quantidade:** 90 linhas. 

### 072. Use CTE para mostrar equipamentos com mais de 1500 minutos de parada, por id.

**Nível:** intermediário · **Tabelas:** equipment, downtime_events

**Formato esperado:** `equipment_id, minutes`. **Quantidade:** 1 linhas. 

### 073. Use CTE para calcular percentual de produção boa por turno, por turno.

**Nível:** intermediário · **Tabelas:** production_records

**Formato esperado:** `shift, pct`. **Quantidade:** 3 linhas. 

### 074. Use duas CTEs para custos e paradas por equipamento sem multiplicar valores nos JOINs; inclua zeros.

**Nível:** intermediário · **Tabelas:** equipment, maintenance_orders, downtime_events

**Formato esperado:** `id, cost, minutes`. **Quantidade:** 18 linhas. 

### 075. Use CTE para taxa de qualidade não good por sensor, por id.

**Nível:** intermediário · **Tabelas:** sensor_readings

**Formato esperado:** `sensor_id, invalid_pct`. **Quantidade:** 72 linhas. 

### 076. Use CTE para produção boa mensal por fábrica, ordenando fábrica e mês.

**Nível:** intermediário · **Tabelas:** production_lines, equipment, production_orders, production_records

**Formato esperado:** `factory_id, month, good`. **Quantidade:** 9 linhas. 

### 077. Use CTE para refugo diário acima de 8%, por dia.

**Nível:** intermediário · **Tabelas:** production_records

**Formato esperado:** `day, pct`. **Quantidade:** 0 linhas. Resultado vazio intencional: explique o que ele demonstra.

### 078. Use CTE para percentual de ordens concluídas por equipamento, por id.

**Nível:** intermediário · **Tabelas:** equipment, production_orders

**Formato esperado:** `equipment_id, pct`. **Quantidade:** 17 linhas. 

### 079. Use CTE para contar anomalias good por tipo de sensor, por tipo.

**Nível:** intermediário · **Tabelas:** sensors, sensor_readings

**Formato esperado:** `kind, anomalies`. **Quantidade:** 4 linhas. 

### 080. Use CTE recursiva para listar todos os dias de setembro, inclusive dias sem dados.

**Nível:** intermediário · **Tabelas:** 

**Formato esperado:** `day`. **Quantidade:** 30 linhas. 

## Window Functions

### 081. Numere equipamentos por capacidade decrescente com ROW_NUMBER; desempate por id.

**Nível:** avançado · **Tabelas:** equipment

**Formato esperado:** `id, capacity_per_hour, position`. **Quantidade:** 18 linhas. 

### 082. Classifique capacidades dentro de cada linha com RANK; ordene linha e posição.

**Nível:** avançado · **Tabelas:** equipment

**Formato esperado:** `id, line_id, capacity_per_hour, ranking`. **Quantidade:** 18 linhas. 

### 083. Use DENSE_RANK para custos totais de manutenção por equipamento, maior primeiro.

**Nível:** avançado · **Tabelas:** equipment, maintenance_orders

**Formato esperado:** `equipment_id, cost, ranking`. **Quantidade:** 17 linhas. 

### 084. Encontre a leitura mais recente de cada sensor com ROW_NUMBER, por sensor.

**Nível:** avançado · **Tabelas:** sensor_readings

**Formato esperado:** `sensor_id, measured_at, value, quality`. **Quantidade:** 72 linhas. 

### 085. Calcule produção boa acumulada diária de agosto com frame ROWS explícito.

**Nível:** avançado · **Tabelas:** production_records

**Formato esperado:** `day, good, accumulated`. **Quantidade:** 31 linhas. 

### 086. Calcule minutos de parada acumulados por equipamento e evento; desempate por id.

**Nível:** avançado · **Tabelas:** equipment, downtime_events

**Formato esperado:** `id, equipment_id, started_at, duration_minutes, accumulated`. **Quantidade:** 223 linhas. 

### 087. Mostre produção boa diária e do dia anterior com LAG.

**Nível:** avançado · **Tabelas:** production_records

**Formato esperado:** `day, good, previous`. **Quantidade:** 90 linhas. 

### 088. Calcule variação absoluta da produção boa diária contra o dia anterior.

**Nível:** avançado · **Tabelas:** production_records

**Formato esperado:** `day, good, delta`. **Quantidade:** 90 linhas. 

### 089. Calcule variação percentual da produção boa diária; primeiro dia NULL.

**Nível:** avançado · **Tabelas:** production_records

**Formato esperado:** `day, good, previous, pct`. **Quantidade:** 90 linhas. 

### 090. Mostre próxima leitura e valor do sensor 1 com LEAD.

**Nível:** avançado · **Tabelas:** sensor_readings

**Formato esperado:** `measured_at, value, next_time, next_value`. **Quantidade:** 368 linhas. 

### 091. Calcule média móvel de sete dias da produção boa diária; início usa dias disponíveis.

**Nível:** avançado · **Tabelas:** production_records

**Formato esperado:** `day, good, moving_average`. **Quantidade:** 90 linhas. 

### 092. Calcule média móvel das quatro últimas leituras do sensor 1 incluindo atual; AVG ignora NULL.

**Nível:** avançado · **Tabelas:** sensor_readings

**Formato esperado:** `measured_at, value, moving_average`. **Quantidade:** 368 linhas. 

### 093. Calcule participação de cada equipamento no total de minutos de parada usando SUM OVER.

**Nível:** avançado · **Tabelas:** equipment, downtime_events

**Formato esperado:** `equipment_id, minutes, pct`. **Quantidade:** 17 linhas. 

### 094. Selecione até três equipamentos com mais paradas por fábrica em setembro; desempate por id usando ROW_NUMBER.

**Nível:** avançado · **Tabelas:** production_lines, equipment, downtime_events

**Formato esperado:** `factory_id, equipment_id, minutes, rn`. **Quantidade:** 9 linhas. 

### 095. Separe equipamentos em quatro grupos por capacidade com NTILE, desempate por id.

**Nível:** avançado · **Tabelas:** equipment

**Formato esperado:** `id, capacity_per_hour, quartile`. **Quantidade:** 18 linhas. 

### 096. Mostre primeira e última leitura do sensor 1 em todas as linhas usando frame completo.

**Nível:** avançado · **Tabelas:** sensor_readings

**Formato esperado:** `measured_at, value, first_value, last_value`. **Quantidade:** 368 linhas. 

### 097. Calcule intervalo em horas entre leituras de cada sensor com LAG; primeiro NULL.

**Nível:** avançado · **Tabelas:** sensor_readings

**Formato esperado:** `sensor_id, measured_at, gap_hours`. **Quantidade:** 26496 linhas. 

### 098. Classifique custo das manutenções por equipamento com DENSE_RANK; mostre todas as maiores empatadas.

**Nível:** avançado · **Tabelas:** equipment, maintenance_orders

**Formato esperado:** `equipment_id, id, cost`. **Quantidade:** 17 linhas. 

### 099. Calcule produção boa mensal e diferença contra mês anterior por fábrica.

**Nível:** avançado · **Tabelas:** production_lines, equipment, production_orders, production_records

**Formato esperado:** `factory_id, month, good, delta`. **Quantidade:** 9 linhas. 

### 100. Monte relatório final por equipamento: boas peças, refugo %, paradas não planejadas, custo e ranking de paradas por fábrica; inclua zeros e refugo NULL sem produção.

**Nível:** avançado · **Tabelas:** production_lines, equipment, production_orders, production_records, maintenance_orders, downtime_events

**Formato esperado:** `id, factory_id, good, scrap_pct, minutes, cost, ranking`. **Quantidade:** 18 linhas.
