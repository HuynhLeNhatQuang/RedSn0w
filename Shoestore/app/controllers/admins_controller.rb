class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@category = Category.where(active:true)
		@shoe = Shoe.search(params[:search], params[:page])
	end
end
