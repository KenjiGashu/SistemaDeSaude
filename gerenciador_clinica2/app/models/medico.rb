class Medico < ActiveRecord::Base
	validates :nome, :presence => true
	validates :especialidade, :presence => true	
	validates :telefone, :presence => true


	scope :sorted, lambda { order("nome ASC") }
end
