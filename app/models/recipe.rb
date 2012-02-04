class Recipe < ActiveRecord::Base
	attr_accessible :name, :instructions, :preperation_time, :description, :image, :course, :ingredients, :post_id, :recipe_id
	mount_uploader :image, ImageUploader
	acts_as :post
	has_many :ingredients, :dependent => :destroy
 	has_many :items, :through => :ingredients
 	has_many :comments
 	has_many :recipe_pictures
 	accepts_nested_attributes_for :ingredients, :allow_destroy => true	

 	validates :name, :presence => true
 	validates :instructions, :presence => :true
 	validates :preperation_time, :presence => :true
 	validates :preperation_time, :numericality => { :only_integer => true }

 	searchable :auto_index => true, :auto_remove => true do 
 		text :name, boost: 5
 		text :description, :instructions
 		text :comments do
 			comments.map(&:message)
 		end
 	end
 	
 	def description_display_breaks
 		display_breaks description
 	end

 	def instructions_display_breaks
 		display_breaks instructions
 	end

  def display_breaks text
  	text.gsub(/\r?\n/, '<br />')
  end
end
