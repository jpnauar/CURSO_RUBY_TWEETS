require './lib/tweets/utils.rb'
require './lib/tweets/crawler.rb'

class TwitsController < ApplicationController
  include Utils
  include Crawler
  
  def new_twit trend
    begin
      twits = Twit.find(:all, :conditions => {:trend_id => trend.id})      
      if twits.nil? or twits.count < 10 #if not exist twit on data base or twits.count < 10
        hash_of_twits = get_twits_for_trend trend.query #call api
        if not hash_of_twits['results'].nil?            
          hash_of_twits['results'].each do |t|
            begin
              twit          = Twit.new              
              twit.id_twit  = t['id_str']
              twit.text     = t['text']
              twit.url      = get_url twit.text #get url from twit text
              twit.url_text = get_url_text twit.url #get title from url              
              twit.trend    = trend #save trend id
              twit.user     = UsersController.new.new_user twit.id_twit.to_i #save user id                        
              twit.save #new twit on data base
            rescue Exception => e
              logger.error e.inspect
            end
          end
        end
      else #looking twits without user
        twits = Twit.find_all_by_user_id(nil, :conditions => {:trend_id => trend.id})
        if not twits.nil?
          twits.each do |t|
            t.user = UsersController.new.new_user t.id_twit.to_i #call user controller
            t.save #update twit on data base
          end
        end        
      end
    rescue Exception => e
      logger.error e.inspect
    end
  end
end