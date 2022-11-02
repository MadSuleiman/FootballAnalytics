.mode "csv"
.separator ","
.headers off

-- Importing every tbl file into a samely named sql table. 
.import './data/players.csv' allData