from pathlib import Path
import sqlite3,random,datetime as dt
BASE=Path(__file__).resolve().parents[1]
r=random.Random(42)
path=BASE/'industrial_operations.db'
if path.exists():
    raise SystemExit('Banco já existe. Renomeie ou remova manualmente para recriar; suas respostas SQL são preservadas.')
c=sqlite3.connect(path)
c.executescript((BASE/'sql/01_schema.sql').read_text(encoding='utf-8'))
def ins(t,rows):
    if rows: c.executemany('INSERT INTO '+t+' VALUES ('+','.join('?' for _ in rows[0])+')',rows)
ins('factories',[(1,'MetalMinas','Contagem'),(2,'AçoSul','Betim'),(3,'ValePeças','Belo Horizonte')])
ins('production_lines',[(i,(i-1)//2+1,'Linha '+str(i)) for i in range(1,7)])
ins('equipment',[(i,(i-1)//3+1,'Máquina '+str(i),'2022-01-01','inactive' if i==18 else 'active',80+i*5) for i in range(1,19)])
kinds=[('temperature','C',10,90),('vibration','mm/s',0,8),('pressure','bar',1,12),('energy','kW',0,100)]
ins('sensors',[(4*(e-1)+k+1,e,f'E{e:02}_{kind}',kind,unit,lo,hi) for e in range(1,19) for k,(kind,unit,lo,hi) in enumerate(kinds)])
ins('employees',[(i,(i-1)//4+1,'Técnico '+str(i),'maintenance' if i%2 else 'operator') for i in range(1,13)])
start=dt.datetime(2026,7,1)
orders=[];records=[];readings=[];maintenance=[];downtime=[]
for day in range(92):
    date=start+dt.timedelta(days=day)
    for e in range(1,18):
        oid=len(orders)+1
        status='cancelled' if oid%31==0 else ('open' if day>=90 else 'completed')
        orders.append((oid,e,['Chapa','Eixo','Carcaça'][e%3],1200,date.date().isoformat(),status))
        if status=='completed':
            for shift,h in [('A',0),('B',8),('C',16)]:
                records.append((len(records)+1,oid,(date+dt.timedelta(hours=h)).isoformat(sep=' '),shift,r.randint(300,420),r.randint(3,35)+(25 if e==4 else 0),r.randint(300,480)))
        if day%7==e%7:
            dur=r.randint(15,110)+(90 if e==4 else 0)
            downtime.append((len(downtime)+1,e,(date+dt.timedelta(hours=3)).isoformat(sep=' '),dur,int(day%3==0),['sensor','mechanical','setup'][day%3]))
        if day%15==e%15:
            opened=date+dt.timedelta(hours=5)
            closed=None if day>85 else (opened+dt.timedelta(hours=2)).isoformat(sep=' ')
            factory=(e-1)//6+1
            employee=None if e%5==0 else (factory-1)*4+1
            maintenance.append((len(maintenance)+1,e,employee,'corrective' if e%3 else 'preventive',opened.isoformat(sep=' '),closed,round(r.uniform(100,1800),2),'Inspeção e ajuste'))
    for sensor in range(1,73):
        kind,unit,lo,hi=kinds[(sensor-1)%4]
        for h in (0,6,12,18):
            quality='missing' if (day+sensor+h)%97==0 else ('bad' if (day+sensor+h)%53==0 else 'good')
            value=None if quality=='missing' else round(r.uniform(lo+(hi-lo)*.25,hi-(hi-lo)*.25),3)
            if value is not None and (sensor==13 and day>60 or (day+sensor+h)%101==0): value=hi+5
            readings.append((len(readings)+1,sensor,(date+dt.timedelta(hours=h)).isoformat(sep=' '),value,quality))
for t,rows in [('production_orders',orders),('production_records',records),('maintenance_orders',maintenance),('downtime_events',downtime),('sensor_readings',readings)]: ins(t,rows)
c.commit()
assert c.execute('PRAGMA integrity_check').fetchone()[0]=='ok'
assert not c.execute('PRAGMA foreign_key_check').fetchall()
print({t:c.execute('SELECT COUNT(*) FROM '+t).fetchone()[0] for t in ['equipment','sensor_readings','production_records']})
c.close()
