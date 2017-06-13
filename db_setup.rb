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
        sql = "CREATE TABLE testoos (
            id serial NOT NULL ,
            user_id INTEGER NOT NULL,
            too_file VARCHAR(200),
            do_it_id  INTEGER NOT NULL,            
            rating TEXT
        ); 
        CREATE TABLE members(
            id serial NOT NULL,
            username varchar(50) NOT NULL,
            join_date DATE NOT NULL,
            password varchar(50)
        );"
        conn.exec(sql)
    end
end
DatabaseSetup.go