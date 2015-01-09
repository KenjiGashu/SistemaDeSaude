class PacientesController < ApplicationController

	layout "principal"

  def index
  	@pacientes = Paciente.sorted
  	# renderiza a pagina com todos os pacientes
  end

  def show
  	@paciente = Paciente.find(params[:id])
  end

  def new
  	@paciente = Paciente.new
  	# renderiza o formulario para cadastro de paciente
  end

  def create
  	@paciente = Paciente.new(get_paciente_params)
  	if @paciente.save
  		flash[:notice] = "Paciente cadastrado com sucesso."
  		redirect_to(:action => "index")
  	else
  		render('new')
  	end
  end

  def edit
  	@paciente = Paciente.find(params[:id])
  end

  def update
  	@paciente = Paciente.find(params[:id])
  	@paciente.update_attributes(get_paciente_params)
  	if @paciente.save
  		flash[:notice] = "Dados do paciente '#{@paciente.nome}' atualizados"
  		redirect_to(:action => "index")
  	else
  		render('edit')
  	end
  end

  def delete
  	@paciente = Paciente.find(params[:id])
  end

  def destroy
  	@paciente = Paciente.find(params[:id]).destroy
  	flash[:notice] = "O paciente #{@paciente.nome} foi deletado."
  	redirect_to(:action => "index")
  end

  private

  def get_paciente_params
  	return params.require(:paciente).permit(:nome, :rg,:cpf, :nascimento,:convenio, :email, :endereco, :telefone, :password, :password_confirmation)
  end
end
