class ProjektsController < ApplicationController
	before_action :find_item, only: [:show, :edit, :update, :destroy, :complete]
	before_action :authenticate_user!
	def index
		
	end

	def new
	end
end
