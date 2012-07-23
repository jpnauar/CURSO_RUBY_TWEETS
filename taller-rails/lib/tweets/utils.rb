require_relative 'api'

require 'json'

module Utils
  include Api
  
  def get_trends
    url     = '/1/trends/1.json'
    result  = get_http_response url
    if result != nil
      hash = JSON.parse(result)
    else
      hash = nil
    end
  end
  
  def get_twits_for_trend trend_query
    url     = "/search.json?q=#{trend_query}"
    result  = get_http_response url
    if result != nil
      hash  = JSON.parse(result)
    else
      hash = nil
    end
  end
  
  def get_twit_by_id twit_id
    url     = "/1/statuses/show/#{twit_id}.json"
    result  = get_http_response url
    if result != nil
      hash = JSON.parse(result)          
    else
      hash = nil
    end
  end
  
  def get_user_information_by_screen_name screen_name
    url     = "/1/users/show.json?screen_name=#{screen_name}"
    result  = get_http_response url
    if result != nil      
      hash = JSON.parse(result)        
    else
      hash = nil
    end
  end
    
end