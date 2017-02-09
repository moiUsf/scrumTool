class SprintretrosController < ApplicationController

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

		@userstories = @projekt.user_stories.where(sprintnumber: @sprint_number)
		
	end

	def setretros
		

		@sprint_id = params[:sprint_id]
		@projekt_id = params[:projekt_id]
		@beibehalten = params[:beibehalten]
		@aufhoeren = params[:aufhoeren]
		@integrieren = params[:integrieren]


		@sprint = Sprint.find(@sprint_id)
		@sprint.beibehalten = @beibehalten
		@sprint.aufhoeren = @aufhoeren
		@sprint.integrieren = @integrieren

		@sprint.save

		flash[:notice] = "Der Sprint " + @sprint.sprintnumber + " ist damit abgeschlossen"


			 redirect_to sprints_path(projekt_id: @projekt_id) 
		
	end
end
