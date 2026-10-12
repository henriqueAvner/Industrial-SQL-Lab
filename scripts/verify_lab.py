from pathlib import Path
import sqlite3,json,re
base=Path(__file__).resolve().parents[1]
c=sqlite3.connect(f"file:{(base/'industrial_operations.db').as_posix()}?mode=ro",uri=True)
assert c.execute('PRAGMA integrity_check').fetchone()[0]=='ok'
assert c.execute('PRAGMA foreign_key_check').fetchall()==[]
expected=json.loads((base/'gabarito/resultados_esperados.json').read_text(encoding='utf-8'))
text=(base/'gabarito/solucoes.sql').read_text(encoding='utf-8')
chunks=re.split(r'-- [0-9]{3}\. [^\n]*\n',text)[1:]
assert len(chunks)==100
for i,sql in enumerate(chunks,1):
    cur=c.execute(sql.strip()); rows=cur.fetchall(); e=expected[str(i)]
    assert [v[0] for v in cur.description]==e['columns'],i
    assert len(rows)==e['row_count'],i
    assert [list(v) for v in rows[:3]]==e['first_rows'],i
print('OK: integridade, FKs e 100 consultas verificadas.')
