class PlanpokersController < ApplicationController
	def index
		@projekt = Projekt.find(params[:projekt_id])
		@projekt_id = params[:projekt_id]
		@userstories = @projekt.user_stories
	end

	def createfields
		@playernumber = params[:playernumber].to_i
		@projekt_id = params[:projekt_id] 
		@projekt = Projekt.find(params[:projekt_id])
		@userstory_id = params[:userstory_id].to_i
		@userstory = UserStory.find(@userstory_id)

	end

	def checkPoker
		
	end


end
