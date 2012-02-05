class Cookbook < ActiveRecord::Base
	acts_as :posts
	
	has_many :recipes, :through => :recipes_cookbooks
end