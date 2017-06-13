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
    end  postgres://tnoxaygjyosthg:b6a0bb49b0e1619bde26ea9f7edcc84b410fc69fa0f944fe6633947102dc2513@ec2-50-19-218-160.compute-1.amazonaws.com:5432/d613j0u3ts58e6
    def self.go
        conn = self.open_connection
        sql = "CREATE TABLE testoos (
            id serial NOT NULL ,
            user_id INTEGER NOT NULL,
            do_it_id  VARCHAR(250) NOT NULL,
            ,rating TEXT
        ); 
        CRREATE TABLE members(
            id serial NOT NULL,
            username varchar(50) NOT NULL,
            join_date DATE NOT NULL,
            password varchar(50)
        );"
        conn.exec(sql)
    end
end
DatabaseSetup.go