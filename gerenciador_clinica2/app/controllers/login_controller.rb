class LoginController < ApplicationController

	def index
		@admin = Admin.new
	end

	def new
		@admin = Admin.new
	end
end
