require 'pg'
class DatabaseSetup
    def self.open_connection
        PG.connect({
            dbname: ENV['DB_NAME'], 
            host: ENV['DB_HOST'],
            port: ENV['DB_PORT'],
            user: ENV['DB_USER'],
            password: ENV['DB_PASSWORD']
        })
    end  
    def self.go
        conn = self.open_connection
        sql = "drop table testoos; create table testoos (
        id              serial not null,
        do_it_id        integer not null,
        user_id         integer not null,
        too_file        varchar(200),
        rating          varchar(30)    
        );
        insert into testoos (user_id, do_it_id,too_file,rating) values(0,1,'race.jpg','3,5');
            insert into members (id,username,join_date,password) values(0,'tester',Current_timestamp,'hi');"
        conn.exec(sql)
    end
end
DatabaseSetup.go