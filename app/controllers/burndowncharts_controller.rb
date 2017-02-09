class BurndownchartsController < ApplicationController

	def index
		@projekt = Projekt.find(params[:format])
		@projekt_name = @projekt.name
		@projekt_id = @projekt.id
	end
end
