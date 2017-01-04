class UserStorysController < ApplicationController
	def index
		@userstory = UserStory.all
	end

	def new
		@userstory = UserStory.new
	end

	def create
		@userstory = UserStory.new
    	if @userstory.save
      		redirect_to user_storys_path
    	else
     		render 'new'  #wenn es nicht klappt, die view new wird nochmal mit den eingegebenen Daten geladen, noch mal versuchen
    	end
	end
end
