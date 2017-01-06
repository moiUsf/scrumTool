class SprintsController < ApplicationController
	
	def index
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		@sprints = Sprint.where(projekt_id: @projekt_id)
	end

	def new
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		@sprints =  projekt.sprints.build
		
	end







	def find_sprint
  		@userstory = Sprint.find(params[:id])
	end

	def sprint_params
		params.require(:sprint).permit(:sprintnumber)
	end
end
