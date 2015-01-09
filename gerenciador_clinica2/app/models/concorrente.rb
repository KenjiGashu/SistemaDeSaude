class Concorrente < ActiveRecord::Base
	validates :nome, :presence => true
	validates :rg, :presence => true
	validates :cpf, :presence => true
	validates :data_nascimento, :presence => true
	validates :endereco, :presence => true
	validates :formacao, :presence => true
	validates :experiencia, :presence => true
	validates :cargo, :presence => true
	scope :sorted, lambda { order("nome ASC") }
end
