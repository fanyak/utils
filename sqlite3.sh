#REF: https://sqlite.org/cli.html#importing_files_as_csv_or_other_formats
# sqlite3> .import --csv --skip 1 df_pdfs.csv log #.import --csv --skip 1 --schema temp C:/work/somedata.csv tab1

# # https://til.simonwillison.net/sqlite/one-line-csv-operations
# sqlite3 :memory: -cmd '.import --csv --skip 1 taxi.csv taxi' \
#   'SELECT passenger_count, COUNT(*), AVG(total_amount) FROM taxi GROUP BY passenger_count'

sqlite3 scrape.db -cmd '.import --csv --skip 1 df_pdfs.csv log' \
</dev/null # exit sqlite3 by closing stdin for the process


# # https://til.simonwillison.net/sqlite/import-csv
# sqlite3 data.db <<EOS
# .mode csv
# .import --csv --skip 1 school.csv schools
# .import --csv --skip 1 state.csv states
# EOS

# # https://til.simonwillison.net/zsh/argument-heredoc
# sqlite3 scrape.db <<'SQL'
# SELECT MAX(date) FROM log;
# SELECT MAX(substr(date,7,4)||'-'||substr(date,4,2)||'-'||substr(date,1,2)) FROM log;
# SELECT date FROM log WHERE date IN ('30/06/2026','20/07/2026') ORDER BY date DESC;
# SQL
