class Trend < ActiveRecord::Base 
  attr_accessible :name, :query, :url  
  
  validates_presence_of :name, :query
  
  validates_uniqueness_of :name  
  
  has_many :twits  
  
end
