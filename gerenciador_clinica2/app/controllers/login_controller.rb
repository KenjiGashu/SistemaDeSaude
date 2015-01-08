class LoginController < ApplicationController


	def index
		@admin = Admin.new
	end

	def new
		@nome = params[:admin][:nome]
		@email = params[:admin][:email]
		@usuario = params[:admin][:usuario] 
		@password = params[:admin][:password]
	end
end
