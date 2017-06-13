class Too
	attr_accessor :id, :user_id, :do_it_id, :too_file, :rating, :tooder, :date, :rated, :password
	
	def self.open_connection
		PG.connect(dbname: "do_it_too")
	end

	def self.hydrate too_data
		too = Too.new
		too.id = too_data['id']
		too.tooder = too_data['username']
		too.date = too_data['join_date']
		too.user_id = too_data['user_id']
		too.too_file = too_data['too_file']
		too.do_it_id = too_data['do_it_id']
		too.rating = too_data['rating']

		if too.rating
		rating = too.rating.split(',')
		a = rating[0].to_f
		b = rating[1].to_f
		too.rated = (a/b*100).round
		
		end
		too	

	end

	# index
	def self.all third
		conn = self.open_connection
		sql = "SELECT t.id, user_id, do_it_id, too_file, rating, username, join_date FROM testoos t INNER JOIN members m ON t.user_id = m.id  WHERE do_it_id = #{third} ORDER BY id"
		results = conn.exec(sql)
		toos = results.map do |tuple| 
        	self.hydrate tuple
  		end
    	toos
	end

	def self.hydrate_tooder tooder_data
	    tooder = Too.new
	    tooder.id = tooder_data['id']
	    tooder.date = tooder_data['join_date']   
	    tooder.tooder = tooder_data['username']
	    tooder.password = tooder_data['password']
	    tooder
	end

	def self.find_tooder id
		conn = self.open_connection
		sql = "SELECT id, username, join_date, password FROM members WHERE id = #{id}"
		result = conn.exec(sql)
		tooder = self.hydrate_tooder result.first
		tooder
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


	def self.register_tooder username,password
		conn = self.open_connection
		sql = "INSERT INTO members (username,join_date,password ) VALUES ('#{username}',CURRENT_TIMESTAMP, '#{password}')"
		conn.exec(sql)
	end

	def update too_file , id
		conn = Too.open_connection
		sql = "UPDATE testoos SET too_file = '#{too_file}' WHERE id = #{id}"
		conn.exec(sql)
	end


	def self.show_last_too id
		conn = self.open_connection
		sql = "SELECT id, user_id, do_it_id, too_file, rating, username,join_date FROM (SELECT t.id, user_id, do_it_id, too_file, rating, username,join_date FROM members m inner join testoos t on m.id  = t.user_id WHERE t.id in (SELECT max(t.id) FROM
		 			 	members m inner join testoos t on m.id  = t.user_id group by username
		 			)
		 		) y 
		 	 	WHERE user_id = #{id}"
		result = conn.exec(sql)

	    too = self.hydrate result.first

	    too

	end

	def self.tooders_toos user_id
		conn = self.open_connection
		sql = "SELECT  t.id, user_id, do_it_id, too_file, rating, username, join_date FROM testoos t INNER JOIN members m ON t.user_id = m.id  WHERE user_id = #{user_id}"
		results = conn.exec(sql)		
	    toos = results.map do |tuple| 
	    	self.hydrate tuple
		end
	    toos

	end
	def self.rate rating,id
		conn = self.open_connection
		sql = "UPDATE testoos SET rating = '#{rating}' WHERE id = #{id}" 
		conn.exec(sql)
	end

	def self.all_tooders
		conn = self.open_connection
		sql = "select id,join_date,password,username from members  where id in (SELECT m.id FROM members m join testoos t on t.user_id = m.id) ORDER BY id "
		results = conn.exec(sql)
		tooders = results.map do |tuple| 
          self.hydrate_tooder tuple
  	    end
   		tooders
	end

	def self.destroy id
		conn = self.open_connection
		sqlo = 'delete from members where id not in (select user_id from testoos)'
		sql = "DELETE FROM testoos WHERE id = #{id}"
		conn.exec(sqlo)
		conn.exec(sql)
	end
	def self.destroy_tooder id
		conn = self.open_connection
		sql = "DELETE FROM members WHERE id = #{id}"
		result = conn.exec(sql)
	end



end