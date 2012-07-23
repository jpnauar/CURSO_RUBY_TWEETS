require_relative 'api'

module Crawler
	include Api
	
	def request_url (url)
		response = get_http_response url
		if response != nil
			response.body		
		end
	end

end
