class SprintreviewsController < ApplicationController

	rescue_from ActiveRecord::RecordNotFound, with: :dude_where_is_my_record

	def dude_where_is_my_record
		@projekt_id = params[:projekt_id]
		@sprint_id = params[:sprint_id]
		@userstory_id = params[:userstory_id]
    	flash[:notice] = "Dude where is my record !!!! no User Story with id = " + @userstory_id.to_s + "  ;-("
    	redirect_to sprintplans_path(sprint_id: @sprint_id, projekt_id: @projekt_id)
  	end

	def index
		@projekt = Projekt.find(params[:projekt_id])
		@projekt_name = @projekt.name
		@projekt_id = params[:projekt_id]
		@sprint_id = params[:sprint_id]
		@sprint = Sprint.find(@sprint_id)
		@sprint_number = @sprint.sprintnumber

		@userstories = @projekt.user_stories.where(status: "done").where(sprintnumber: @sprint_number)
		
	end

	def setreview
		



		@sprint_id = params[:sprint_id]
		@sprintnumber = Sprint.find(@sprint_id).sprintnumber
		@projekt_id = params[:projekt_id] 
		@projekt = Projekt.find(params[:projekt_id])
		@projekt_name = @projekt.name
		@userstory_id = params[:userstory_id].to_i
		@userstory = UserStory.find(@userstory_id)
		@userstories = @projekt.user_stories
		@reviewcomment = params[:reviewcomment] 
		@accepted = params[:accepted] 

		#if @userstory.projekt_id !=  @projekt_id 
			#flash[:notice] = "Die User Story gehört nicht den aktuellen Sprint, bitte nur die User Story links auswählen"
			#redirect_to sprintplans_path(sprint_id: @sprint_id, projekt_id: @projekt_id)
		@userstoriesToRev = @projekt.user_stories.where(status: "done").where(sprintnumber: @sprintnumber)
		unless @userstoriesToRev.include?(@userstory)
			flash[:notice] = "Die User Story gehört nicht den aktuellen Sprint, bitte nur die User Story links auswählen"
			redirect_to sprintreviews_path(sprint_id: @sprint_id, projekt_id: @projekt_id)
		else

			flash[:notice] = "es fonktioniert !!"
			#@userstory.sprintnumber = @sprintnumber
			#@userstory.save
			#render 'setsprint', projekt_id: @projekt_id, sprint_id: @sprint_id
		end
	end
		
	
end
