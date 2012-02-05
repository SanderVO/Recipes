class Post < ActiveRecord::Base
	acts_as_superclass
	
	belongs_to :user
	has_many :recipes
	has_many :cookbooks
end