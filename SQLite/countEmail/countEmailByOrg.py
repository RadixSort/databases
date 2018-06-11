import sqlite3

conn = sqlite3.connect('emaildb.sqlite') #creates if not exist
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS Counts')
cur.execute('CREATE TABLE Counts (org TEXT, count INTEGER)')

fname = 'mbox.txt'
fh = open(fname)
for line in fh: #parsing through each line
    if not line.startswith('From: '): continue
    atPos = line.find('@')
    spPos = line.find(' ',atPos)
    org = line[atPos+1:spPos]
    cur.execute('SELECT count FROM Counts WHERE org = ? ', (org,)) #questionmark against sql injection, replaced by tuple
    row = cur.fetchone()
    if row is None:
        cur.execute('''INSERT INTO Counts (org, count)
                VALUES (?, 1)''', (org,))
    else:
        cur.execute('UPDATE Counts SET count = count + 1 WHERE org = ?', (org,))

conn.commit()

sqlstr = 'SELECT org, count FROM Counts ORDER BY count DESC LIMIT 10'
for row in cur.execute(sqlstr):
    print(str(row[0]), row[1])

cur.close()