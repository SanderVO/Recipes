class Recipe < ActiveRecord::Base
	acts_as :post

	# Attributes
	attr_accessible :name, :instructions, :preperation_time, :description, :image, :course, :ingredients_attributes, :post, :recipe_id, :user, :unit
	mount_uploader :image, ImageUploader

	# Relations
	has_many :ingredients, :dependent => :destroy
 	has_many :items, :through => :ingredients
 	has_many :comments
 	has_many :recipe_pictures
 	accepts_nested_attributes_for :ingredients, :allow_destroy => true	

 	# Validators
 	validates :name, :presence => true
 	validates :instructions, :presence => :true
 	validates :preperation_time, :presence => :true
 	validates :preperation_time, :numericality => { :only_integer => true }
 	validates :image, :presence => true

 	# Solr search
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
