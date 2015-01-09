class AgendamentoController < ApplicationController
  
  before_action :confirm_logged_in, :only => [:busca, :novo]

  layout "principal"
  
  def index
  	@medico = Medico.new
  end

  def busca
  	puts @nome = params["consulta"]["nome"]
  	puts @crm = params["consulta"]["CRM"]
  	puts @especialidade = params["consulta"]["especialidade"]
  	puts @nome
  	if !@nome.blank? and !@crm.blank? and !@especialidade.blank?
  		@medicos = Medico.where(["nome = ? and crm = ? and especialidade = ?", @nome, @crm, @especialidade])
  	
  	elsif !@nome.blank? and !@crm.blank? and @especialidade.blank?
  		@medicos = Medico.where(["nome = ? and crm = ? ", @nome, @crm])
  	
  	elsif !@nome.blank? and @crm.blank? and !@especialidade.blank?
  		@medicos = Medico.where(["nome = ? and especialidade = ?", @nome, @especialidade])
  	
  	elsif !@nome.blank? and @crm.blank? and @especialidade.blank?
  		@medicos = Medico.where(["nome = ?", @nome ])
  	
  	elsif @nome.blank? and @crm.blank? and @especialidade.blank?
  		@medicos = Medico.all
  	
  	elsif @nome.blank? and @crm.blank? and !@especialidade.blank?
  	 	@medicos = Medico.where(["especialidade = ?", @especialidade ])
  	
  	elsif @nome.blank? and !@crm.blank? and @especialidade.blank?
  	 	@medicos = Medico.where(["CRM = ?", @crm ])
  	
  	else 
  		@medicos = Medico.where(["CRM = ? and especialidade = ?", @crm, @especialidade])
  	end
  end

  def novo
  	@consulta = Consulta.new
  end

  def salvar
  	@consulta = Consulta.new(get_consulta_params)
    if @consulta.save
    	flash[:notice] = "consulta agendada com sucesso."
    	redirect_to(:controller => 'principal', :action => "index")
    else

     	render('novo')
    end
  end


  private

  def get_consulta_params
    return params.require(:consulta).permit(:paciente_id,:medico_id, :motivo, :data, :horario)
  end
end
