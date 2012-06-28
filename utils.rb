require_relative 'crawler'
require_relative 'trend'
require_relative 'twit'
require_relative 'user'

require 'json'

class Utils
	
	attr_accessor :iarray_of_trends, :array_of_twits
	
	def initialize	
		@array_of_trends = nil
		@array_of_twits	= nil
	end
	
	def array_of_trends
		@array_of_trends 		
	end
	
	def array_of_twits
		@array_of_twits
	end

	def get_trends
		url		= '/1/trends/1.json'
		response	= Crawler.request_url url
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
		response 	= Crawler.request_url url
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
		result 	= Crawler.request_url url
		if result != nil
			hash			= JSON.parse(result)
			user_twit 		= hash['user']		
			screen_name	= user_twit['screen_name']
			get_user_information_by_screen_name screen_name
		end
	end

	def get_user_information_by_screen_name(screen_name)
		url 		= "/1/users/show.json?screen_name=#{screen_name}"
		result 	= Crawler.request_url(url)
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

class Consola
	def consola_get_trends
		option 		= 0
		option_from	= 0
		option_to		= 0
		array_of_trends	= nil
		util = Utils.new
		while true			
			if util.array_of_trends == nil
				puts ""
				puts "Trending Topics"
				puts "---------------"
				util.get_trends
				array_of_trends	= util.array_of_trends
				option_from	= util.array_of_trends.first.id
				option_to	 	= util.array_of_trends.last.id
			end
			puts ""
			puts "Enter trend option: (or 99 to exit)" 
			option = gets.strip.to_i		
			STDOUT.flush 			
			if option.between?(option_from, option_to) 
				option 	-= 1 #reto 1 porque el array comienza en la posición 0
				trend 	 = array_of_trends[option]
				consola_get_twits_for_trend(util, trend)				
			else
				if option == 99
					exit
				else
					puts "Invalid option"
				end
			end
		end		
	end
	
	private 	
	def consola_get_twits_for_trend (util, trend)		
		while true
			if util.array_of_twits == nil
				puts ""
				puts "Twits for Trend"
				puts "---------------"
				util.get_twits_for_trend (trend.query)
				array_of_twits	= util.array_of_twits
				option_from	= util.array_of_twits.first.id
				option_to	 	= util.array_of_twits.last.id
			end
			puts ""
			puts "Enter twit option: (or 99 to return)"	
			option = gets.strip.to_i
			STDOUT.flush 
			if option.between?(option_from, option_to)
				option 	-= 1 #resta 1 porque el array comienza en la posición 0
				twit 	 	 = array_of_twits[option]
				puts ""
				puts "Information of User Twit"
				puts "------------------------"
				util.get_twit_by_id(twit.id_twit)
				while true
					puts ""
					puts "Enter 99 to return"
					option = gets.strip.to_i
					STDOUT.flush 
					if option == 99
						util.array_of_twits = nil
						break
					end
				end
			else
				if option == 99
					util = nil
					consola_get_trends
				else
					puts "Invalid option"
				end
			end
		end
	end
end

Consola.new.consola_get_trends

#~ util = Utils.new
#~ util.get_trends
#~ util.get_twits_for_trend 'MMG'
#~ 315076593
#~ util.get_twit_by_id 217780234576068608
