require "net/http"
require "uri"

module Api
	
	def get_http_response (url)
		begin			
			response = Net::HTTP.get_response('api.twitter.com',url)
		rescue StandardError
			puts "Error"
		end
	end

end