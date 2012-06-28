class User
	attr_accessor :id, :name, :screen_name, :location, :description, :followers_count, :friends_count	
	
	def initialize(id, name, screen_name, location, description, followers_count, friends_count)
		@id 			= id
		@name		= name
		@screen_name	= screen_name
		@location		= location
		@description	= description
		@followers_count	= followers_count
		@friends_count	= friends_count
	end
	
	def to_s
		"Name: #{@name} \nScreen Name: #{@screen_name}\nLocation: #{@location}\nDescription: #{@description}\nFollowers Count: #{@followers_count}\nFriends Count: #{@friends_count}"
	end
		
	def id
		@id
	end
	
	def name
		@name
	end
	
	def screen_name
		@screen_name
	end
	
	def location
		@location
	end
	
	def description
		@description
	end 
	
	def followers_count
		@followers_count
	end 
	
	def friends_count
		@friends_count
	end 
	
	
end
