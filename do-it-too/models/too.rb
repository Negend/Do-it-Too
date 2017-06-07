class Too
	attr_accessor :id, :title, :body
	
	def self.open_connection
		PG.connect(dbname: "blog")
	end

	def self.hydrate too_data
    too = Too.new
    too.id = too_data['id']
    too.title = too_data['title']
    too.body = too_data['body']
    too
	end

	# index
	def self.all
		conn = self.open_connection
		sql = "SELECT id, title, body FROM too ORDER BY id"
		results = conn.exec(sql)
		toos = results.map do |tuple| 
        self.hydrate tuple
  	end

    toos
	end