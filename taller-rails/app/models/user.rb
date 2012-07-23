class User < ActiveRecord::Base
  attr_accessible :description, :followers_count, :friends_count, :location, :name, :screen_name
  
  validates_uniqueness_of :name, :screen_name
  
  validates_presence_of :name, :screen_name
  
  has_many :twits
end
