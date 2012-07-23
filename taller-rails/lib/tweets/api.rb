require 'net/http'
#require "uri"

module Api
	
	def get_http_response url	  
		begin      
			response = Net::HTTP.get_response('api.twitter.com',url)
      if response != nil
        response.body   
      end
    rescue Exception => e
      logger.error e.inspect
    end
	end

end