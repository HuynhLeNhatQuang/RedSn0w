class UsersController < ApplicationController
	before_action :authenticate_user!
	impressionist :actions=>[:index, :show]
	def index
  		@shoe = Shoe.search(params[:search], params[:page])
  		impressionist(@shoe)
		@category = Category.all
		#@shoe = Shoe.all
	end
	def show
		@shoe = Shoe.find(params[:id])
  		impressionist(@shoe)
	end
	private
end
