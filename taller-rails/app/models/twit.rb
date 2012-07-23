class Twit < ActiveRecord::Base
  attr_accessible :id_twit, :text, :url, :url_text, :trend, :user  
  
  validates_presence_of :id_twit, :trend, :user
  
  validates_uniqueness_of :id_twit
  
  belongs_to :trend
  belongs_to :user  
end
