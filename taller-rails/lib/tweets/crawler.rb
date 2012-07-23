require 'open-uri'
require 'nokogiri'  

module Crawler
	
  def get_url text
    url = URI.extract(text, ['http', 'https']) #get urls from text
    if not url.nil?
      url_twit = url[0]
    else
      url_twit = ""
    end
  end
  
	def get_url_text url_twit
	  if not url_twit.nil?  
	    doc = Nokogiri::HTML(open(url_twit)) 
	    url_text = doc.at_css("title").text
	  else
	    url_text = ""
	  end 
	end
end
