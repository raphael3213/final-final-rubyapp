class InventoriesController < ApplicationController

	def new

		render 'new'
	end

	def create
		@err=Inventory.import(params[:file])
		session[:error]=@err
		flash[:success]="Imported Successfully"
		render 'new'
		end

end
