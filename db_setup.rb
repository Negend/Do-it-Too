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
        sql = "
        delete from testoos where too_file ='race.jpg' ;
            delete from members where username = tester;"
        conn.exec(sql)
    end
end
DatabaseSetup.go