class ProjektsController < ApplicationController
	before_action :find_projekt, only: [:show, :edit, :update, :destroy, :complete]
	before_action :authenticate_user!
	def index
		@projekts = Projekt.all
	end

	def new
		@projekt = Projekt.new
	end

	def create
		@projekt = Projekt.new(projekt_params)
    	if @projekt.save
      		redirect_to root_path
    	else
     		render 'new'  #wenn es nicht klappt, die view new wird nochmal mit den eingegebenen Daten geladen, noch mal versuchen
    	end
	end

	def find_projekt
    	@projekt = Projekt.find(params[:id])
  	end

  	def projekt_params
  		params.require(:projekt).permit(:name)
  	end
end
