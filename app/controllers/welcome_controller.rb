class WelcomeController < ApplicationController
	before_action :authenticate_user!, only: :home
	before_action :check_status


	def welcome
	end

	def home
	end

end
