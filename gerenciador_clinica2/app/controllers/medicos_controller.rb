class MedicosController < ApplicationController
  
  layout "geral"

  def index
    @medicos = Medico.sorted
    # renderiza a pagina com todos os medicos
  end

  def show
    @medico = Medico.find(params[:id])
  end

  def new
    @medico = Medico.new
    # renderiza o formulario para cadastro de medico
  end

  def create
    @medico = Medico.new(get_medico_params)
    if @medico.save
      flash[:notice] = "medico cadastrado com sucesso."
      redirect_to(:action => "index")
    else
      render('new')
    end
  end

  def edit
    @medico = Medico.find(params[:id])
  end

  def update
    @medico = Medico.find(params[:id])
    @medico.update_attributes(get_medico_params)
    if @medico.save
      flash[:notice] = "Dados do medico '#{@medico.nome}' atualizados"
      redirect_to(:action => "index")
    else
      render('edit')
    end
  end

  def delete
    @medico = Medico.find(params[:id])
  end

  def destroy
    @medico = Medico.find(params[:id]).destroy
    flash[:notice] = "O medico #{@medico.nome} foi deletado."
    redirect_to(:action => "index")
  end

  private

  def get_medico_params
    return params.require(:medico).permit(:nome, :especialidade, :telefone)
  end
end
