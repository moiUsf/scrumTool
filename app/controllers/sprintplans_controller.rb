class SprintplansController < ApplicationController

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

		@userstories = @projekt.user_stories.where("sprintnumber = 1 or sprintnumber = '""' or sprintnumber is NULL ")
		
	end


	def setsprint


		@sprintnumber = params[:sprintnumber].to_i
		@sprint_number = params[:sprint_number].to_i
		@sprint_id = params[:sprint_id]
		@projekt_id = params[:projekt_id] 
		@projekt = Projekt.find(params[:projekt_id])
		@projekt_name = @projekt.name
		@userstory_id = params[:userstory_id].to_i
		@userstory = UserStory.find(@userstory_id)
		@userstories = @projekt.user_stories

		if @userstory.sprintnumber != ("" || nil) 
			flash[:notice] = "Die User Story wurde schon ein Sprint zugeordnet, bitte nur die User Story ohne sprintsvermerk auswählen"
			redirect_to sprintplans_path(sprint_id: @sprint_id, projekt_id: @projekt_id)

		else
			@userstory.sprintnumber = @sprintnumber
			@userstory.save
			render 'setsprint', projekt_id: @projekt_id, sprint_id: @sprint_id
		end
	end
end
