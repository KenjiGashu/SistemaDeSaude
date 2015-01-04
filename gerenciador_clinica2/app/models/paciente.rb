class Paciente < ActiveRecord::Base

	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :nome, :presence => true
	validates :rg, :presence => true
	validates :endereco, :presence => true
	validates :telefone, :presence => true
	validates :email, :presence => true,
 										:format => EMAIL_REGEX,
 										:confirmation => true

	scope :sorted, lambda { order("nome ASC") }

end
