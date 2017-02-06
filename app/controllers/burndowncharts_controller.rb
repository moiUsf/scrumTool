class BurndownchartsController < ApplicationController

	def index
		@projekt = Projekt.find(params[:format])
		@projekt_name = @projekt.name
	end
end
