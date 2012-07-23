require './lib/tweets/utils.rb'

class UsersController < ApplicationController
  include Utils
  
  def new_user id_twit
    begin      
      hash_of_user = get_twit_by_id id_twit
      if hash_of_user != nil
        hash_user_twit            = hash_of_user['user']    
        screen_name               = hash_user_twit['screen_name']
        hash_of_user_information  = get_user_information_by_screen_name screen_name
      end      
      if hash_of_user_information != nil
        user = User.find(:first, :conditions => {:screen_name => hash_of_user_information['screen_name']})
        if user.nil? #if not exist user on data base 
          user                  = User.new
          user.name             = hash_of_user_information['name']
          user.screen_name      = hash_of_user_information['screen_name']
          user.location         = hash_of_user_information['location']
          user.description      = hash_of_user_information['description']
          user.followers_count  = hash_of_user_information['followers_count']
          user.friends_count    = hash_of_user_information['friends_count']        
          user.save #new user on data base
        end
        user
      end
    rescue Exception => e
      logger.error e.inspect
    end 
  end  

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end
end
