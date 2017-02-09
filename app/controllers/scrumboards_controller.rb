class ScrumboardsController < ApplicationController
	def index
		@sprintnumber = params[:sprintnumber]
		@sprint = Sprint.where(sprintnumber: @sprintnumber)
		@projekt_id = params[:projekt_id]
		@sprint_id = @sprint.ids

		@userstoriesBack = UserStory
								.where(sprintnumber: @sprintnumber)
								.where(status: "backlog")
								.where(projekt_id: @projekt_id)


		@userstoriesInPro = UserStory
								.where(sprintnumber: @sprintnumber)
								.where(status: "inProgress")
								.where(projekt_id: @projekt_id)


		@userstoriesRev = UserStory
								.where(sprintnumber: @sprintnumber)
								.where(status: "review")
								.where(projekt_id: @projekt_id)


		@userstoriesDone = UserStory
								.where(sprintnumber: @sprintnumber)
								.where(status: "done")
								.where(projekt_id: @projekt_id)


		
	end
end
