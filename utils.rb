require_relative 'crawler'
require_relative 'trend'
require_relative 'twit'
require_relative 'user'

require 'json'

class Utils	
	include Crawler
	
	attr_accessor :array_of_trends, :array_of_twits
	
	def initialize	
		@array_of_trends = nil
		@array_of_twits	= nil
	end

	def get_trends
		url		= '/1/trends/1.json'
		response	= request_url url
		if response != nil
			hash		= JSON.parse(response)
			trends 	= hash[0]['trends']
			@array_of_trends = Array.new()
			for i in 0...trends.size			
				id	= i + 1				
				query = trends[i]['query']
				name	= trends[i]['name']
				url	= trends[i]['url']
				trend = Trend.new(id, name, query, url)				
				@array_of_trends.push(trend)				
				puts trend.to_s
			end
		end
	end

	def get_twits_for_trend (trend)
		url 		= "/search.json?q=#{trend}"
		response 	= request_url url
		if response != nil
			hash 	= JSON.parse(response)
			twits	= hash['results']
			@array_of_twits = Array.new()
			for i in 0...twits.size
				id			= i + 1
				id_twit		= twits[i]['id']
				created_at 	= twits[i]['created_at']
				text			= twits[i]['text']
				from_user_id	= twits[i]['from_user_id']
				links			= twits[i]['links']
				twit = Twit.new(id, id_twit, created_at, text, from_user_id, links)
				@array_of_twits.push(twit)
				puts twit.to_s
			end			
		end
	end

	def get_twit_by_id (twit_id)
		url		= "/1/statuses/show/#{twit_id}.json"
		result 	= request_url url
		if result != nil
			hash			= JSON.parse(result)
			user_twit 		= hash['user']		
			screen_name	= user_twit['screen_name']
			get_user_information_by_screen_name screen_name
		end
	end

	def get_user_information_by_screen_name(screen_name)
		url 		= "/1/users/show.json?screen_name=#{screen_name}"
		result 	= request_url(url)
		if result != nil			
			hash_user_information = JSON.parse(result)
			id			= hash_user_information['id']
			name			= hash_user_information['name']
			screen_name	= hash_user_information['screen_name']
			location		= hash_user_information['location']
			description		= hash_user_information['description']
			followers_count	= hash_user_information['followers_count']
			friends_count	= hash_user_information['friends_count']
			user = User.new(id, name, screen_name, location, description, followers_count, friends_count)
			puts user.to_s
		end
	end
	
end