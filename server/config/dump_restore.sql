pg_dump -h localhost -p 5432 -U gyftsie_app -Fc -b -v -f dump20230125.sql -j 2 -d  store


pg_restore -v -h gyftsie-store.cxaukzo5ss7k.us-west-1.rds.amazonaws.com -U gyftsie_app -d gyftsietest dump20230125.sql