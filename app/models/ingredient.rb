class Ingredient < ActiveRecord::Base
	attr_accessible :name, :quantity, :category, :unit
	has_one :category
	belongs_to :recipe
end