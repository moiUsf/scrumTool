class UserStorysController < ApplicationController
	before_action :find_userstorie, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index

		projekt = Projekt.find(params[:id])
		@id = projekt.id
		@userstorys = projekt.user_stories
		 
	end

	def new
		projekt = Projekt.find(@id)
		@userstory =  projekt.user_stories.build#UserStory.new
	end

	def create
		@userstory = projekt.user_stories.build#UserStory.new(userstorie_params)
    	if @userstory.save
      		redirect_to user_storys_path
    	else
     		render 'new'  #wenn es nicht klappt, die view new wird nochmal mit den eingegebenen Daten geladen, noch mal versuchen
    	end
	end


	def show
  	end

  	def edit
	end

	def update
		if @userstory.update(userstorie_params)
			redirect_to user_story_path(@userstory)
		else
			render 'edit'
		end
	end

	def destroy
		@userstory.destroy
  		redirect_to user_storys_path
	end














	def find_userstorie
  	@userstory = UserStory.find(params[:id])
	end

	def userstorie_params
		params.require(:user_story).permit(:title, :description)
	end
end
