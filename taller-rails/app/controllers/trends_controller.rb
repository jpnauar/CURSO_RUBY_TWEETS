require './lib/tweets/utils.rb'

class TrendsController < ApplicationController
  include Utils 
  
  # GET /trends
  # GET /trends.json
  def index 
    @trends = Trend.find(:all, :order => "id desc", :limit => 10) #the last ten trends    
  end

  # GET /trends/1
  # GET /trends/1.json
  def show    
    @trend = Trend.find(params[:id])
    
    TwitsController.new.new_twit @trend    
      
    @twits  = Twit.find(:all, :conditions => { :trend_id => @trend.id}, :order => "id desc", :limit => 10) #twits of trends       
  
  end  
 
  # GET /trends/new
  # GET /trends/new.json
  def new 
    begin   
      hash_of_trends = get_trends 
      if hash_of_trends[0] != nil      
        hash_of_trends[0]['trends'].each do |t|
          trend       = Trend.new
          trend.name  = t['name']
          trend.query = t['query']
          trend.url   = t['url']                   
          trend.save
        end            
      end
    rescue Exception => e
      logger.error e.inspect
    end
    redirect_to :action => :index
  end
end
