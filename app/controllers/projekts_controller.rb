class ProjektsController < ApplicationController
	before_action :find_projekt, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	def index
		@projekts = current_user.projekts
	end

	def new
		@projekt = current_user.projekts.build
	end

	def create
		@projekt = current_user.projekts.build(projekt_params)
    	if @projekt.save
      		redirect_to root_path
    	else
     		render 'new'  #wenn es nicht klappt, die view new wird nochmal mit den eingegebenen Daten geladen, noch mal versuchen
    	end
	end

	def show
  	end

	def edit
	end

	def update
	if @projekt.update(projekt_params)
		redirect_to projekt_path(@projekt)
	else
		render 'edit'
	end
	end

	def destroy
		@projekt.destroy
  	redirect_to root_path
	end


  def find_projekt
  	@projekt = Projekt.find(params[:id])
	end

	def projekt_params
		params.require(:projekt).permit(:name)
	end
end
