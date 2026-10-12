-- 001. Liste todas as fábricas por id.
SELECT * FROM factories ORDER BY id;

-- 002. Mostre nome e cidade das fábricas por nome.
SELECT name,city FROM factories ORDER BY name;

-- 003. Liste equipamentos por id.
SELECT * FROM equipment ORDER BY id;

-- 004. Mostre os equipamentos ativos por id.
SELECT id,name FROM equipment WHERE status='active' ORDER BY id;

-- 005. Mostre os equipamentos inativos por id.
SELECT id,name FROM equipment WHERE status='inactive' ORDER BY id;

-- 006. Liste equipamentos com capacidade superior a 140, por id.
SELECT id,capacity_per_hour FROM equipment WHERE capacity_per_hour>140 ORDER BY id;

-- 007. Liste sensores de temperatura por id.
SELECT id,tag FROM sensors WHERE kind='temperature' ORDER BY id;

-- 008. Liste sensores de pressão ou vibração por id usando IN.
SELECT id,tag,kind FROM sensors WHERE kind IN ('pressure','vibration') ORDER BY id;

-- 009. Liste técnicos cujo nome termina em 1, por id.
SELECT * FROM employees WHERE name LIKE '%1' ORDER BY id;

-- 010. Mostre as cinco primeiras leituras por id.
SELECT * FROM sensor_readings ORDER BY id LIMIT 5;

-- 011. Liste cidades distintas alfabeticamente.
SELECT DISTINCT city FROM factories ORDER BY city;

-- 012. Liste produtos distintos alfabeticamente.
SELECT DISTINCT product FROM production_orders ORDER BY product;

-- 013. Liste manutenções sem responsável por id.
SELECT * FROM maintenance_orders WHERE employee_id IS NULL ORDER BY id;

-- 014. Liste leituras sem valor por id.
SELECT * FROM sensor_readings WHERE value IS NULL ORDER BY id;

-- 015. Liste manutenções ainda abertas por id.
SELECT * FROM maintenance_orders WHERE closed_at IS NULL ORDER BY id;

-- 016. Liste ordens de agosto por id usando intervalo semiaberto.
SELECT * FROM production_orders WHERE due_date>='2026-08-01' AND due_date<'2026-09-01' ORDER BY id;

-- 017. Liste leituras do sensor 1 de 1 a 7 de setembro inclusive, por horário.
SELECT * FROM sensor_readings WHERE sensor_id=1 AND measured_at>='2026-09-01' AND measured_at<'2026-09-08' ORDER BY measured_at;

-- 018. Liste paradas não planejadas acima de 100 minutos por id.
SELECT * FROM downtime_events WHERE planned=0 AND duration_minutes>100 ORDER BY id;

-- 019. Liste ordens abertas ou canceladas por id.
SELECT * FROM production_orders WHERE status IN ('open','cancelled') ORDER BY id;

-- 020. Mostre as dez manutenções mais caras; desempate por id.
SELECT id,cost FROM maintenance_orders ORDER BY cost DESC,id LIMIT 10;

-- 021. Calcule produção total de cada registro: boas mais refugos, por id.
SELECT id,good_qty+scrap_qty AS total_qty FROM production_records ORDER BY id;

-- 022. Calcule percentual de refugos de cada registro com duas casas, por id.
SELECT id,ROUND(100.0*scrap_qty/NULLIF(good_qty+scrap_qty,0),2) AS scrap_pct FROM production_records ORDER BY id;

-- 023. Converta duração de cada parada em horas com duas casas, por id.
SELECT id,ROUND(duration_minutes/60.0,2) AS hours FROM downtime_events ORDER BY id;

-- 024. Exiba id de manutenção e responsável; use Sem responsável para NULL.
SELECT id,COALESCE(CAST(employee_id AS TEXT),'Sem responsável') AS responsible FROM maintenance_orders ORDER BY id;

-- 025. Classifique paradas: longa se >=120 minutos, curta caso contrário; por id.
SELECT id,CASE WHEN duration_minutes>=120 THEN 'longa' ELSE 'curta' END AS category FROM downtime_events ORDER BY id;

-- 026. Extraia mês YYYY-MM das ordens; mostre id e mês por id.
SELECT id,substr(due_date,1,7) AS month FROM production_orders ORDER BY id;

-- 027. Mostre tag dos sensores em minúsculas, por id.
SELECT id,lower(tag) AS tag FROM sensors ORDER BY id;

-- 028. Calcule duração em horas das manutenções encerradas com duas casas.
SELECT id,ROUND((julianday(closed_at)-julianday(opened_at))*24,2) AS hours FROM maintenance_orders WHERE closed_at IS NOT NULL ORDER BY id;

-- 029. Classifique leituras do sensor 1: ausente, acima de 90 ou normal; por id.
SELECT id,CASE WHEN value IS NULL THEN 'ausente' WHEN value>90 THEN 'acima' ELSE 'normal' END AS category FROM sensor_readings WHERE sensor_id=1 ORDER BY id;

-- 030. Mostre dia e hora das primeiras 20 leituras por id.
SELECT id,date(measured_at) AS day,strftime('%H',measured_at) AS hour FROM sensor_readings ORDER BY id LIMIT 20;

-- 031. Conte todos os equipamentos.
SELECT COUNT(*) AS equipment_count FROM equipment;

-- 032. Conte leituras e valores não nulos.
SELECT COUNT(*) AS readings,COUNT(value) AS non_null_values FROM sensor_readings;

-- 033. Calcule mínimo, máximo e média dos custos de manutenção.
SELECT MIN(cost) AS minimum,MAX(cost) AS maximum,AVG(cost) AS average FROM maintenance_orders;

-- 034. Some boas peças e refugos de toda a produção.
SELECT SUM(good_qty) AS good,SUM(scrap_qty) AS scrap FROM production_records;

-- 035. Conte sensores por tipo, ordenando pelo tipo.
SELECT kind,COUNT(*) AS sensors FROM sensors GROUP BY kind ORDER BY kind;

-- 036. Conte ordens por status, ordenando pelo status.
SELECT status,COUNT(*) AS orders FROM production_orders GROUP BY status ORDER BY status;

-- 037. Some produção boa por turno, ordenando pelo turno.
SELECT shift,SUM(good_qty) AS good FROM production_records GROUP BY shift ORDER BY shift;

-- 038. Some minutos de parada por equipamento, por id.
SELECT equipment_id,SUM(duration_minutes) AS minutes FROM downtime_events GROUP BY equipment_id ORDER BY equipment_id;

-- 039. Calcule custo de manutenção por equipamento, por id.
SELECT equipment_id,SUM(cost) AS cost FROM maintenance_orders GROUP BY equipment_id ORDER BY equipment_id;

-- 040. Calcule média das leituras good por sensor, por id.
SELECT sensor_id,AVG(value) AS average FROM sensor_readings WHERE quality='good' GROUP BY sensor_id ORDER BY sensor_id;

-- 041. Mostre equipamentos com mais de 1500 minutos de parada, por id.
SELECT equipment_id,SUM(duration_minutes) AS minutes FROM downtime_events GROUP BY equipment_id HAVING SUM(duration_minutes)>1500 ORDER BY equipment_id;

-- 042. Mostre sensores com mais de três valores ausentes, por id.
SELECT sensor_id,COUNT(*) AS missing FROM sensor_readings WHERE value IS NULL GROUP BY sensor_id HAVING COUNT(*)>3 ORDER BY sensor_id;

-- 043. Some custo por tipo de manutenção, por tipo.
SELECT kind,SUM(cost) AS cost FROM maintenance_orders GROUP BY kind ORDER BY kind;

-- 044. Calcule produção boa diária em agosto, por dia.
SELECT date(recorded_at) AS day,SUM(good_qty) AS good FROM production_records WHERE recorded_at>='2026-08-01' AND recorded_at<'2026-09-01' GROUP BY day ORDER BY day;

-- 045. Conte paradas por mês, ordenando mês.
SELECT substr(started_at,1,7) AS month,COUNT(*) AS events FROM downtime_events GROUP BY month ORDER BY month;

-- 046. Liste linhas com o nome da fábrica, por id da linha.
SELECT l.id,l.name,f.name AS factory FROM production_lines l JOIN factories f ON f.id=l.factory_id ORDER BY l.id;

-- 047. Liste equipamentos com linha e fábrica, por id de equipamento.
SELECT e.id,e.name,l.name AS line,f.name AS factory FROM equipment e JOIN production_lines l ON l.id=e.line_id JOIN factories f ON f.id=l.factory_id ORDER BY e.id;

-- 048. Liste sensores com o nome do equipamento, por id do sensor.
SELECT s.id,s.tag,e.name FROM sensors s JOIN equipment e ON e.id=s.equipment_id ORDER BY s.id;

-- 049. Liste manutenções com o nome do responsável incluindo as sem responsável, por id.
SELECT m.id,emp.name FROM maintenance_orders m LEFT JOIN employees emp ON emp.id=m.employee_id ORDER BY m.id;

-- 050. Liste equipamentos sem manutenção, por id.
SELECT e.id,e.name FROM equipment e LEFT JOIN maintenance_orders m ON m.equipment_id=e.id WHERE m.id IS NULL ORDER BY e.id;

-- 051. Conte equipamentos por fábrica, por id da fábrica.
SELECT f.id,f.name,COUNT(e.id) AS equipment_count FROM factories f JOIN production_lines l ON l.factory_id=f.id JOIN equipment e ON e.line_id=l.id GROUP BY f.id,f.name ORDER BY f.id;

-- 052. Some produção boa por equipamento incluindo zero para quem não produziu, por id.
SELECT e.id,COALESCE(SUM(r.good_qty),0) AS good FROM equipment e LEFT JOIN production_orders o ON o.equipment_id=e.id LEFT JOIN production_records r ON r.order_id=o.id GROUP BY e.id ORDER BY e.id;

-- 053. Calcule média de temperatura good por equipamento, por id.
SELECT e.id,AVG(r.value) AS temperature FROM equipment e JOIN sensors s ON s.equipment_id=e.id JOIN sensor_readings r ON r.sensor_id=s.id WHERE s.kind='temperature' AND r.quality='good' GROUP BY e.id ORDER BY e.id;

-- 054. Liste leituras good fora dos limites do próprio sensor, por id da leitura.
SELECT r.id,s.tag,r.value,s.min_value,s.max_value FROM sensor_readings r JOIN sensors s ON s.id=r.sensor_id WHERE r.quality='good' AND (r.value<s.min_value OR r.value>s.max_value) ORDER BY r.id;

-- 055. Some custo de manutenção por fábrica, por id da fábrica.
SELECT f.id,SUM(m.cost) AS cost FROM factories f JOIN production_lines l ON l.factory_id=f.id JOIN equipment e ON e.line_id=l.id JOIN maintenance_orders m ON m.equipment_id=e.id GROUP BY f.id ORDER BY f.id;

-- 056. Some minutos de parada não planejada por linha, por id.
SELECT l.id,SUM(d.duration_minutes) AS minutes FROM production_lines l JOIN equipment e ON e.line_id=l.id JOIN downtime_events d ON d.equipment_id=e.id WHERE d.planned=0 GROUP BY l.id ORDER BY l.id;

-- 057. Liste ordens sem registros de produção, por id.
SELECT o.id,o.status FROM production_orders o LEFT JOIN production_records r ON r.order_id=o.id WHERE r.id IS NULL ORDER BY o.id;

-- 058. Calcule refugo percentual ponderado por produto, por produto.
SELECT o.product,100.0*SUM(r.scrap_qty)/NULLIF(SUM(r.good_qty+r.scrap_qty),0) AS scrap_pct FROM production_orders o JOIN production_records r ON r.order_id=o.id GROUP BY o.product ORDER BY o.product;

-- 059. Mostre manutenções cujo responsável pertence a outra fábrica, por id.
SELECT m.id FROM maintenance_orders m JOIN employees emp ON emp.id=m.employee_id JOIN equipment e ON e.id=m.equipment_id JOIN production_lines l ON l.id=e.line_id WHERE emp.factory_id<>l.factory_id ORDER BY m.id;

-- 060. Calcule quantidade de leituras missing por fábrica, por id.
SELECT f.id,COUNT(*) AS missing FROM factories f JOIN production_lines l ON l.factory_id=f.id JOIN equipment e ON e.line_id=l.id JOIN sensors s ON s.equipment_id=e.id JOIN sensor_readings r ON r.sensor_id=s.id WHERE r.quality='missing' GROUP BY f.id ORDER BY f.id;

-- 061. Liste manutenções com custo acima da média global, por id.
SELECT id,cost FROM maintenance_orders WHERE cost>(SELECT AVG(cost) FROM maintenance_orders) ORDER BY id;

-- 062. Liste equipamentos com alguma manutenção corretiva usando EXISTS, por id.
SELECT e.id,e.name FROM equipment e WHERE EXISTS(SELECT 1 FROM maintenance_orders m WHERE m.equipment_id=e.id AND m.kind='corrective') ORDER BY e.id;

-- 063. Liste equipamentos sem paradas usando NOT EXISTS, por id.
SELECT e.id FROM equipment e WHERE NOT EXISTS(SELECT 1 FROM downtime_events d WHERE d.equipment_id=e.id) ORDER BY e.id;

-- 064. Liste equipamentos cuja capacidade supera a média da própria linha, por id.
SELECT e.id,e.capacity_per_hour FROM equipment e WHERE e.capacity_per_hour>(SELECT AVG(e2.capacity_per_hour) FROM equipment e2 WHERE e2.line_id=e.line_id) ORDER BY e.id;

-- 065. Liste sensores que já registraram valor good acima do limite, por id.
SELECT s.id,s.tag FROM sensors s WHERE EXISTS(SELECT 1 FROM sensor_readings r WHERE r.sensor_id=s.id AND r.quality='good' AND r.value>s.max_value) ORDER BY s.id;

-- 066. Liste ordens com produção boa total abaixo da meta incluindo zero, por id.
SELECT o.id,o.planned_qty,COALESCE((SELECT SUM(r.good_qty) FROM production_records r WHERE r.order_id=o.id),0) AS good FROM production_orders o WHERE COALESCE((SELECT SUM(r.good_qty) FROM production_records r WHERE r.order_id=o.id),0)<o.planned_qty ORDER BY o.id;

-- 067. Liste todas as manutenções de custo máximo, incluindo empates, por id.
SELECT id,cost FROM maintenance_orders WHERE cost=(SELECT MAX(cost) FROM maintenance_orders) ORDER BY id;

-- 068. Liste sensores sem leituras usando NOT EXISTS, por id.
SELECT s.id FROM sensors s WHERE NOT EXISTS(SELECT 1 FROM sensor_readings r WHERE r.sensor_id=s.id) ORDER BY s.id;

-- 069. Liste fábricas com algum equipamento inativo usando EXISTS, por id.
SELECT f.id FROM factories f WHERE EXISTS(SELECT 1 FROM production_lines l JOIN equipment e ON e.line_id=l.id WHERE l.factory_id=f.id AND e.status='inactive') ORDER BY f.id;

-- 070. Liste manutenções com custo acima da média do próprio equipamento, por id.
SELECT m.id,m.cost FROM maintenance_orders m WHERE m.cost>(SELECT AVG(m2.cost) FROM maintenance_orders m2 WHERE m2.equipment_id=m.equipment_id) ORDER BY m.id;

-- 071. Use CTE para produção boa diária, por dia.
WITH daily AS (SELECT date(recorded_at) AS day,SUM(good_qty) AS good FROM production_records GROUP BY day) SELECT * FROM daily ORDER BY day;

-- 072. Use CTE para mostrar equipamentos com mais de 1500 minutos de parada, por id.
WITH totals AS (SELECT equipment_id,SUM(duration_minutes) AS minutes FROM downtime_events GROUP BY equipment_id) SELECT * FROM totals WHERE minutes>1500 ORDER BY equipment_id;

-- 073. Use CTE para calcular percentual de produção boa por turno, por turno.
WITH totals AS (SELECT shift,SUM(good_qty) AS good FROM production_records GROUP BY shift) SELECT shift,100.0*good/(SELECT SUM(good) FROM totals) AS pct FROM totals ORDER BY shift;

-- 074. Use duas CTEs para custos e paradas por equipamento sem multiplicar valores nos JOINs; inclua zeros.
WITH costs AS (SELECT equipment_id,SUM(cost) AS cost FROM maintenance_orders GROUP BY equipment_id), stops AS (SELECT equipment_id,SUM(duration_minutes) AS minutes FROM downtime_events GROUP BY equipment_id) SELECT e.id,COALESCE(c.cost,0) AS cost,COALESCE(s.minutes,0) AS minutes FROM equipment e LEFT JOIN costs c ON c.equipment_id=e.id LEFT JOIN stops s ON s.equipment_id=e.id ORDER BY e.id;

-- 075. Use CTE para taxa de qualidade não good por sensor, por id.
WITH stats AS (SELECT sensor_id,COUNT(*) AS total,SUM(CASE WHEN quality<>'good' THEN 1 ELSE 0 END) AS invalid FROM sensor_readings GROUP BY sensor_id) SELECT sensor_id,100.0*invalid/total AS invalid_pct FROM stats ORDER BY sensor_id;

-- 076. Use CTE para produção boa mensal por fábrica, ordenando fábrica e mês.
WITH monthly AS (SELECT l.factory_id,substr(r.recorded_at,1,7) AS month,SUM(r.good_qty) AS good FROM production_records r JOIN production_orders o ON o.id=r.order_id JOIN equipment e ON e.id=o.equipment_id JOIN production_lines l ON l.id=e.line_id GROUP BY l.factory_id,month) SELECT * FROM monthly ORDER BY factory_id,month;

-- 077. Use CTE para refugo diário acima de 8%, por dia.
WITH daily AS (SELECT date(recorded_at) AS day,SUM(scrap_qty) AS scrap,SUM(good_qty+scrap_qty) AS total FROM production_records GROUP BY day) SELECT day,100.0*scrap/total AS pct FROM daily WHERE 100.0*scrap/total>8 ORDER BY day;

-- 078. Use CTE para percentual de ordens concluídas por equipamento, por id.
WITH stats AS (SELECT equipment_id,COUNT(*) AS total,SUM(CASE WHEN status='completed' THEN 1 ELSE 0 END) AS completed FROM production_orders GROUP BY equipment_id) SELECT equipment_id,100.0*completed/total AS pct FROM stats ORDER BY equipment_id;

-- 079. Use CTE para contar anomalias good por tipo de sensor, por tipo.
WITH anomalies AS (SELECT s.kind FROM sensors s JOIN sensor_readings r ON r.sensor_id=s.id WHERE r.quality='good' AND (r.value<s.min_value OR r.value>s.max_value)) SELECT kind,COUNT(*) AS anomalies FROM anomalies GROUP BY kind ORDER BY kind;

-- 080. Use CTE recursiva para listar todos os dias de setembro, inclusive dias sem dados.
WITH RECURSIVE days(day) AS (SELECT '2026-09-01' UNION ALL SELECT date(day,'+1 day') FROM days WHERE day<'2026-09-30') SELECT day FROM days ORDER BY day;

-- 081. Numere equipamentos por capacidade decrescente com ROW_NUMBER; desempate por id.
SELECT id,capacity_per_hour,ROW_NUMBER() OVER(ORDER BY capacity_per_hour DESC,id) AS position FROM equipment ORDER BY position;

-- 082. Classifique capacidades dentro de cada linha com RANK; ordene linha e posição.
SELECT id,line_id,capacity_per_hour,RANK() OVER(PARTITION BY line_id ORDER BY capacity_per_hour DESC) AS ranking FROM equipment ORDER BY line_id,ranking,id;

-- 083. Use DENSE_RANK para custos totais de manutenção por equipamento, maior primeiro.
WITH costs AS (SELECT equipment_id,SUM(cost) AS cost FROM maintenance_orders GROUP BY equipment_id) SELECT *,DENSE_RANK() OVER(ORDER BY cost DESC) AS ranking FROM costs ORDER BY ranking,equipment_id;

-- 084. Encontre a leitura mais recente de cada sensor com ROW_NUMBER, por sensor.
WITH ranked AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY sensor_id ORDER BY measured_at DESC,id DESC) AS rn FROM sensor_readings) SELECT sensor_id,measured_at,value,quality FROM ranked WHERE rn=1 ORDER BY sensor_id;

-- 085. Calcule produção boa acumulada diária de agosto com frame ROWS explícito.
WITH daily AS (SELECT date(recorded_at) AS day,SUM(good_qty) AS good FROM production_records WHERE recorded_at>='2026-08-01' AND recorded_at<'2026-09-01' GROUP BY day) SELECT *,SUM(good) OVER(ORDER BY day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS accumulated FROM daily ORDER BY day;

-- 086. Calcule minutos de parada acumulados por equipamento e evento; desempate por id.
SELECT id,equipment_id,started_at,duration_minutes,SUM(duration_minutes) OVER(PARTITION BY equipment_id ORDER BY started_at,id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS accumulated FROM downtime_events ORDER BY equipment_id,started_at,id;

-- 087. Mostre produção boa diária e do dia anterior com LAG.
WITH daily AS (SELECT date(recorded_at) AS day,SUM(good_qty) AS good FROM production_records GROUP BY day) SELECT *,LAG(good) OVER(ORDER BY day) AS previous FROM daily ORDER BY day;

-- 088. Calcule variação absoluta da produção boa diária contra o dia anterior.
WITH daily AS (SELECT date(recorded_at) AS day,SUM(good_qty) AS good FROM production_records GROUP BY day) SELECT *,good-LAG(good) OVER(ORDER BY day) AS delta FROM daily ORDER BY day;

-- 089. Calcule variação percentual da produção boa diária; primeiro dia NULL.
WITH daily AS (SELECT date(recorded_at) AS day,SUM(good_qty) AS good FROM production_records GROUP BY day), prev AS (SELECT *,LAG(good) OVER(ORDER BY day) AS previous FROM daily) SELECT *,100.0*(good-previous)/NULLIF(previous,0) AS pct FROM prev ORDER BY day;

-- 090. Mostre próxima leitura e valor do sensor 1 com LEAD.
SELECT measured_at,value,LEAD(measured_at) OVER(ORDER BY measured_at) AS next_time,LEAD(value) OVER(ORDER BY measured_at) AS next_value FROM sensor_readings WHERE sensor_id=1 ORDER BY measured_at;

-- 091. Calcule média móvel de sete dias da produção boa diária; início usa dias disponíveis.
WITH daily AS (SELECT date(recorded_at) AS day,SUM(good_qty) AS good FROM production_records GROUP BY day) SELECT *,AVG(good) OVER(ORDER BY day ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_average FROM daily ORDER BY day;

-- 092. Calcule média móvel das quatro últimas leituras do sensor 1 incluindo atual; AVG ignora NULL.
SELECT measured_at,value,AVG(value) OVER(ORDER BY measured_at ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS moving_average FROM sensor_readings WHERE sensor_id=1 ORDER BY measured_at;

-- 093. Calcule participação de cada equipamento no total de minutos de parada usando SUM OVER.
WITH totals AS (SELECT equipment_id,SUM(duration_minutes) AS minutes FROM downtime_events GROUP BY equipment_id) SELECT *,100.0*minutes/SUM(minutes) OVER() AS pct FROM totals ORDER BY equipment_id;

-- 094. Selecione até três equipamentos com mais paradas por fábrica em setembro; desempate por id usando ROW_NUMBER.
WITH totals AS (SELECT l.factory_id,e.id AS equipment_id,SUM(d.duration_minutes) AS minutes FROM downtime_events d JOIN equipment e ON e.id=d.equipment_id JOIN production_lines l ON l.id=e.line_id WHERE d.started_at>='2026-09-01' AND d.started_at<'2026-10-01' GROUP BY l.factory_id,e.id), ranked AS (SELECT *,ROW_NUMBER() OVER(PARTITION BY factory_id ORDER BY minutes DESC,equipment_id) AS rn FROM totals) SELECT * FROM ranked WHERE rn<=3 ORDER BY factory_id,rn;

-- 095. Separe equipamentos em quatro grupos por capacidade com NTILE, desempate por id.
SELECT id,capacity_per_hour,NTILE(4) OVER(ORDER BY capacity_per_hour,id) AS quartile FROM equipment ORDER BY capacity_per_hour,id;

-- 096. Mostre primeira e última leitura do sensor 1 em todas as linhas usando frame completo.
SELECT measured_at,value,FIRST_VALUE(value) OVER(ORDER BY measured_at ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS first_value,LAST_VALUE(value) OVER(ORDER BY measured_at ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value FROM sensor_readings WHERE sensor_id=1 ORDER BY measured_at;

-- 097. Calcule intervalo em horas entre leituras de cada sensor com LAG; primeiro NULL.
SELECT sensor_id,measured_at,ROUND((julianday(measured_at)-julianday(LAG(measured_at) OVER(PARTITION BY sensor_id ORDER BY measured_at)))*24,2) AS gap_hours FROM sensor_readings ORDER BY sensor_id,measured_at;

-- 098. Classifique custo das manutenções por equipamento com DENSE_RANK; mostre todas as maiores empatadas.
WITH ranked AS (SELECT *,DENSE_RANK() OVER(PARTITION BY equipment_id ORDER BY cost DESC) AS ranking FROM maintenance_orders) SELECT equipment_id,id,cost FROM ranked WHERE ranking=1 ORDER BY equipment_id,id;

-- 099. Calcule produção boa mensal e diferença contra mês anterior por fábrica.
WITH monthly AS (SELECT l.factory_id,substr(r.recorded_at,1,7) AS month,SUM(r.good_qty) AS good FROM production_records r JOIN production_orders o ON o.id=r.order_id JOIN equipment e ON e.id=o.equipment_id JOIN production_lines l ON l.id=e.line_id GROUP BY l.factory_id,month) SELECT *,good-LAG(good) OVER(PARTITION BY factory_id ORDER BY month) AS delta FROM monthly ORDER BY factory_id,month;

-- 100. Monte relatório final por equipamento: boas peças, refugo %, paradas não planejadas, custo e ranking de paradas por fábrica; inclua zeros e refugo NULL sem produção.
WITH prod AS (SELECT o.equipment_id,SUM(r.good_qty) AS good,SUM(r.scrap_qty) AS scrap FROM production_orders o JOIN production_records r ON r.order_id=o.id GROUP BY o.equipment_id), stops AS (SELECT equipment_id,SUM(duration_minutes) AS minutes FROM downtime_events WHERE planned=0 GROUP BY equipment_id), costs AS (SELECT equipment_id,SUM(cost) AS cost FROM maintenance_orders GROUP BY equipment_id) SELECT e.id,l.factory_id,COALESCE(p.good,0) AS good,100.0*p.scrap/NULLIF(p.good+p.scrap,0) AS scrap_pct,COALESCE(s.minutes,0) AS minutes,COALESCE(c.cost,0) AS cost,DENSE_RANK() OVER(PARTITION BY l.factory_id ORDER BY COALESCE(s.minutes,0) DESC) AS ranking FROM equipment e JOIN production_lines l ON l.id=e.line_id LEFT JOIN prod p ON p.equipment_id=e.id LEFT JOIN stops s ON s.equipment_id=e.id LEFT JOIN costs c ON c.equipment_id=e.id ORDER BY l.factory_id,ranking,e.id;
