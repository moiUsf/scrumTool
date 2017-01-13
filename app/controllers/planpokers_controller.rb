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

	def checkpoker

		@userstory_id = params[:userstory_id]
		@playernumber = params[:playernumber]
		@projekt_id = params[:projekt_id]
		

		@playernames = params[:playernames] 
		@playername1 = @playernames[0]
		@playername2 = @playernames[1]

		@estimations  = params[:estimations] 
		@estimations1 = @estimations[0]
		@estimations2 = @estimations[1]


		if @estimations1 = @estimations2
			redirect_to pokersuccess_path(userstory_id: @userstory_id)
		else
			redirect_to createfields_path(userstory_id: @userstory_id, projekt_id: @projekt_id, playernumber: @playernumber)
		end
	
	end

	
	def pokersuccess

	end


end
