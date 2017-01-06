class SprintsController < ApplicationController
	before_action :find_sprint, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	
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

	def create
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		@sprint = projekt.sprints.build(sprint_params) #UserStory.new(userstorie_params)
    	if @sprint.save
      		redirect_to sprints_path(projekt_id: @projekt_id)
    	else
     		render 'new'  
    	end
	end

	def show
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
  	end

  	def edit
  		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
	end

	def update
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		if @sprint.update(sprint_params)
			redirect_to sprint_path(@sprint,projekt_id: @projekt_id)
		else
			render 'edit'
		end
	end

	def destroy
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		@sprint.destroy
  		redirect_to sprints_path(projekt_id: @projekt_id)
	end







	def find_sprint
  		@sprint = Sprint.find(params[:id])
	end

	def sprint_params
		params.require(:sprint).permit(:sprintnumber)
	end
end
