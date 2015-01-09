class LoginController < ApplicationController


	layout "principal"
	def index
		@user = User.new
	end

	def new
		if params[:user][:password] == params[:confirm_password]
			@user = User.new(get_user_params)
		  	if @user.save
		  		flash[:notice] = "usuario cadastrado com sucesso."
		  		redirect_to(:controller => 'principal', :action => "index")
		  	else
		  		render('index')
		  	end
		else
			flash[:notice] = "confirmação de senha errada"
			render('index')
		end
	end

	def login
	end

	def atempt_login
		if params[:usuario].present? && params[:password].present?
		  found_user = User.where(:usuario => params[:usuario]).first
		  if found_user
		    authorized_user = found_user.authenticate(params[:password])
		  end
		end
		if authorized_user
		  session[:user_id] = authorized_user.id
		  session[:usuario] = authorized_user.usuario
		  flash[:notice] = "vc esta logado"
		  redirect_to(:controller => 'principal', :action => 'index')
		else
		  flash[:notice] = "usuario ou senha invalidas"
		  redirect_to(:action => 'login')
		end
	end

	def logout
		session[:user_id] = nil
		session[:usuario] = nil
		flash[:notice] = "logout"
		redirect_to(:controller => 'principal', :action => 'index')
	end


	private

	def get_user_params
 		return params.require(:user).permit(:nome, :rg, :cpf, :nascimento, :convenio, :endereco, :telefone, :usuario,:email, :password)
	end


end
