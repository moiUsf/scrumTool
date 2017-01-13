class PlanpokersController < ApplicationController
	def index
		@projekt = Projekt.find(params[:projekt_id]) 
		@userstories = @projekt.user_stories
	end
end
