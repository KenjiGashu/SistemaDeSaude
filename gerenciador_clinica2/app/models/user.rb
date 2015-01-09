class User < ActiveRecord::Base
	has_secure_password
	validates :usuario, :presence => true
	validates :email, :presence => true
	validates :password, :presence => true

end
