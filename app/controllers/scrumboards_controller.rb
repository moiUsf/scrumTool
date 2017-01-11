class ScrumboardsController < ApplicationController
	def index
		@sprintnumber = params[:sprintnumber]
		@sprint = Sprint.where(sprintnumber: @sprintnumber)
		@projekt_id = params[:projekt_id]
		@sprint_id = @sprint.ids

		@userstoriesBack = UserStory
								.where(sprintnumber: @sprintnumber)
								.where(status: "backlog")


		@userstoriesInPro = UserStory
								.where(sprintnumber: @sprintnumber)
								.where(status: "inProgress")


		@userstoriesRev = UserStory
								.where(sprintnumber: @sprintnumber)
								.where(status: "review")


		@userstoriesDone = UserStory
								.where(sprintnumber: @sprintnumber)
								.where(status: "done")


		
	end
end
