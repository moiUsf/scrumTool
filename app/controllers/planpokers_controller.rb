class PlanpokersController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :dude_where_is_my_record

	def dude_where_is_my_record
		@projekt_id = params[:projekt_id]
		@userstory_id = params[:userstory_id]
    	flash[:notice] = "Dude where is my record !!!! no User Story with id = " + @userstory_id + "  ;-("
    	redirect_to planpokers_path(projekt_id: @projekt_id)
  	end

	def index
		@projekt = Projekt.find(params[:projekt_id])
		@projekt_id = params[:projekt_id]
		@userstories = @projekt.user_stories.where(estimation: nil)
	end

	def createfields
		@playernumber = params[:playernumber].to_i
		@projekt_id = params[:projekt_id] 
		@projekt = Projekt.find(params[:projekt_id])
		@userstory_id = params[:userstory_id].to_i
		@userstory = UserStory.find(@userstory_id)

		if @userstory.estimation != nil
			flash[:notice] = "Die User Story wurde schon eingeschätzt!! bitte nur vom Backlog auswählen"
			redirect_to planpokers_path(projekt_id: @projekt_id)

		else
			render 'createfields'
		end


	end

	def checkpoker

		@userstory_id = params[:userstory_id]
		@playernumber = params[:playernumber]
		@projekt_id = params[:projekt_id]
		

		@playernames = params[:playernames] 
		@playername1 = @playernames[0]
		@playername2 = @playernames[1]

		@estimations  = params[:estimations] 
		@estimation1 = @estimations[0]
		@estimation2 = @estimations[1]


		if @estimation1 == @estimation2
			@userstory = UserStory.find(@userstory_id)
			@userstory.estimation = @estimation1
			@userstory.save
			redirect_to pokersuccess_path(userstory_id: @userstory_id, projekt_id: @projekt_id, estimation: @estimation1)
		else
			flash[:notice] = "Die Einschätzungen waren unterschiedlich, diskutiren Sie warum, danach nochmal einschätzen"
			redirect_to createfields_path(userstory_id: @userstory_id, projekt_id: @projekt_id, playernumber: @playernumber)
		end
	
	end

	
	def pokersuccess
		@projekt_id = params[:projekt_id]

	end


end
