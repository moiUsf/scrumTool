class PlanpokersController < ApplicationController
	def index
		@projekt = Projekt.find(params[:projekt_id])
		@projekt_id = params[:projekt_id]
		@userstories = @projekt.user_stories
	end

	def createfields
		@playernumber = params[:playernumber]
		@projekt_id = params[:projekt_id] 

	end
end
