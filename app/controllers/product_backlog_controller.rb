class ProductBacklogController < ApplicationController
  before_action :find_userStory, only: [:show, :edit, :update, :destroy, :complete]
	before_action :authenticate_user!
	def index
		
	end

	def new
		@userStory = ProductBacklog.new
	end

	


	
    def find_userStory
    	@userStory = ProductBacklog.find(params[:id])
  	end

  	def userStory_params
  		params.require(:userStory).permit(:name)
  	end
end
