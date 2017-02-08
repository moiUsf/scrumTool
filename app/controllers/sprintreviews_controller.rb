class SprintreviewsController < ApplicationController

	def index
		@projekt = Projekt.find(params[:projekt_id])
		@projekt_name = @projekt.name
		@projekt_id = params[:projekt_id]
		@sprint = Sprint.find(params[:format])
		@sprint_id = params[:format]
		@sprint_number = @sprint.sprintnumber
	end
end
