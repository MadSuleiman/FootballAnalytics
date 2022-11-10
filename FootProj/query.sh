sqlite3 main.db <queryTables.sql >queries.out

for (( i=1; i<=20; i++ ))
do
	sqlite3 main.db <./queries/$i.sql >./results/${i}.res
done