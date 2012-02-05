class Identity < OmniAuth::Identity::Models::ActiveRecord
	attr_accessible :name, :email, :password

	 # Validators
 	validates :name, :presence => true, :uniqueness => true
 	validates :email, :presence => :true, :uniqueness => true
	validates :password, :presence => :true, :length => { :minimum => 5, :maximum => 40 }, :confirmation => true
	validates_confirmation_of :password
end