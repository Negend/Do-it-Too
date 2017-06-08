class Too
	attr_accessor :id, :user_id, :do_it_id, :too_file, :rating, :tooder, :date
	
	def self.open_connection
		PG.connect(dbname: "do_it_too")
	end

	def self.hydrate too_data
    too = Too.new
    too.id = too_data['id']
    too.date = too_data['join_date']
    too.user_id = too_data['user_id']
    too.too_file = too_data['too_file']
    too.do_it_id = too_data['do_it_id']
    too.rating = too_data['rating']
    too.tooder = too_data['username']
    too
	end

	# index
	def self.all
		conn = self.open_connection
		sql = "SELECT id, too_file, rating FROM testoos ORDER BY id"
		results = conn.exec(sql)
		toos = results.map do |tuple| 
        self.hydrate tuple
  	end

    toos
	end

	


	def self.save do_it_id,user_id,too_file
		conn = self.open_connection
		sql = "INSERT INTO testoos (user_id ,do_it_id ,too_file) VALUES (#{user_id},#{do_it_id},'#{too_file}')"
		conn.exec(sql)
	end

	def self.find_user_id username
		conn = self.open_connection
		sql = "SELECT id FROM members WHERE username = '#{username}'"
		# SELECT id FROM members WHERE username = 'gyro'
		result = conn.exec(sql)
		id = result[0]['id'].to_i
		id
	end


	def self.find_by_id id
		conn = self.open_connection
		sql = "SELECT  t.id, user_id, do_it_id, too_file, rating, username, join_date FROM testoos t INNER JOIN members m ON t.user_id = m.id WHERE t.id = #{id}"
		result = conn.exec(sql)
    too = self.hydrate result.first
    too
	end

	def self.find_by_tooder username
		self.find_user_id username
		conn = self.open_connection
		sql = "SELECT  id,  user_id, do_it_id, too_file, rating FROM testoos WHERE id = #{user_id}"
		results = conn.exec(sql)
	   	toos = results.map do |tuple| 
	        self.hydrate tuple
	  	end

	    toos
	end


	def self.register_tooder username
		conn = self.open_connection
		sql = "INSERT INTO members (username,join_date) VALUES (#{username},CURRENT_TIMESTAMP)"
		result = conn.exec(sql)
	end

end