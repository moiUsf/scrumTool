class ScrumboardsController < ApplicationController
	def index
		@sprintnumber = params[:sprintnumber]
		@sprint = Sprint.where(sprintnumber: @sprintnumber)
		@sprint_id = @sprint.ids
		@userstories = UserStory.where(sprintnumber: @sprintnumber)
	end
end
