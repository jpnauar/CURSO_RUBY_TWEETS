require_relative 'api'

module Crawler

	def self.request_url (url)
		response = Api.get_http_response url
		if response != nil
			response.body		
		end
	end

end
