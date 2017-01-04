class UserStorysController < ApplicationController
	def index
	end

	def new
		@userStory = UserStory.new
	end
end
