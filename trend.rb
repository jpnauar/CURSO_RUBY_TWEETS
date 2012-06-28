class Trend
	attr_accessor :id, :name, :query, :url
	
	def initialize(id, name, query, url) # constructor
		@id 		= id
		@name	= name
		@query	= query
		@url		= url
	end
	
	def to_s
		"#{@id} - #{@name}"
	end
		
	def id
		@id
	end
	
	def name
		@name
	end
	
	def query
		@query
	end
	
	def url
		@url
	end 
	
	
end
