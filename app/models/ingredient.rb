class Ingredient < ActiveRecord::Base
	attr_accessible :name, :quantity, :category, :unit
	has_one :category
	has_one :unit
	belongs_to :recipe
end