class Twit
	
	attr_accessor :id, :id_twit, :created_at, :text, :from_user_id, :links
	
	def initialize(id, id_twit, created_at, text, from_user_id, links)
		@id 			= id
		@id_twit		= id_twit
		@created_at	= created_at
		@text		= text
		@from_user_id	= from_user_id		
		@links		= links
	end
	
	def to_s
		"#{@id} - #{@text}"
	end
	
	def id
		@id
	end
	
	def id_twit
		@id_twit
	end
	
	def created_at
		@created_at
	end 
	
	def text
		@text
	end
	
	def from_user_id
		@from_user_id
	end
	
	def links
		@links
	end
	
end
