require_relative 'utils'

module Consola
	def self.get_trends
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
				get_twits_for_trend(util, trend)				
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
	def self.get_twits_for_trend (util, trend)		
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
					get_trends
				else
					puts "Invalid option"
				end
			end
		end
	end
end

Consola.get_trends