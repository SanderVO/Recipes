class Recipe < ActiveRecord::Base
	acts_as :post
	
<<<<<<< HEAD
	# Attributes
	attr_accessible :name, :instructions, :preperation_time, :description, :image, :course, :ingredients,:quantity, :ingredient
=======
	attr_accessible :name, :instructions, :preperation_time, :description, :image, :course, :ingredients, :post, :recipe_id, :user
>>>>>>> 8fc1ec26babde39ae538c2068f9bd1340861fed7
	mount_uploader :image, ImageUploader

	# Relations
	has_many :ingredients, :dependent => :destroy
 	has_many :items, :through => :ingredients
 	has_many :comments
<<<<<<< HEAD
 	accepts_nested_attributes_for :ingredients, :allow_destroy => true
=======
 	has_many :recipe_pictures
 	accepts_nested_attributes_for :ingredients, :allow_destroy => true	
>>>>>>> 8fc1ec26babde39ae538c2068f9bd1340861fed7

 	# Validators
 	validates :name, :presence => true
 	validates :instructions, :presence => :true
 	validates :preperation_time, :presence => :true
 	validates :preperation_time, :numericality => { :only_integer => true }

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
