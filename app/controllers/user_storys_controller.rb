class UserStorysController < ApplicationController
	before_action :find_userstorie, only: [:show, :edit, :update, :destroy]
	#before_action :find_projekt, only: [:new, :show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index

		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		@userstorys = projekt.user_stories
		 
	end


	def new
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		@user_stories =  projekt.user_stories.build #UserStory.new
	end

	def create
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		@userstory = projekt.user_stories.build(userstorie_params) #UserStory.new(userstorie_params)
    	if @userstory.save
    		
      		redirect_to user_storys_path(projekt_id: @projekt_id)
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
		if @userstory.update(userstorie_params)
			redirect_to user_story_path(@userstory,projekt_id: @projekt_id)
		else
			render 'edit'
		end
	end

	def destroy
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
		@userstory.destroy
  		redirect_to user_storys_path(projekt_id: @projekt_id)
	end


	def find_projekt
		projekt = Projekt.find(params[:projekt_id])
		@projekt_id = projekt.id
	end


	def find_userstorie
  		@userstory = UserStory.find(params[:id])
	end

	def userstorie_params
		params.require(:user_story).permit(:title, :description, :projekt_id, :sprintnumber, :status)
	end
end
