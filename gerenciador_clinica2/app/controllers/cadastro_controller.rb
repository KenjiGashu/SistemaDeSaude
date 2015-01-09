class CadastroController < ApplicationController
  layout "principal"

  def index
  	@concorrente = Concorrente.new()
  end

  def salva
	@concorrente = Concorrente.new(get_medico_params)
	if @concorrente.save
	  flash[:notice] = "cadastrado com sucesso."
	  redirect_to(:controller => 'principal',:action => "index")
	else
		puts("erro")
	  render('index')
	end
  end

  private

  def get_medico_params
    return params.require(:concorrente).permit(:nome, :rg, :cpf, :data_nascimento, :endereco, :formacao, :experiencia, :cargo)
  end
end
