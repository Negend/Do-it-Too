class Tooder
	attr_accessor :id, :tooder, :join_date
	def self.open_connection
		PG.connect(dbname: "do_it_too")
	end

	def self.hydrate too_data
    tooder = tooderder.new
    tooder.id = tooder_data['id']
    tooder.date = tooder_data['join_date']   
    tooder.tooder = tooder_data['username']
    tooder
	end

	def self.all
		conn = self.open_connection
		sql = "SELECT id, username, join_date FROM testoos ORDER BY id"
		results = conn.exec(sql)
		tooders = results.map do |tuple| 
        self.hydrate tuple
  	end

    	toos
	end

	def self.find_user_id username
		conn = self.open_connection
		sql = "SELECT id FROM members WHERE username = '#{username}'"
		result = conn.exec(sql)
		id = result[0]['id'].to_i
		id
	end

	def self.register_tooder username
		conn = self.open_connection
		sql = "INSERT INTO members (username,join_date) VALUES ('#{username}',CURRENT_TIMESTAMP)"
		conn.exec(sql)
	end

	
end
