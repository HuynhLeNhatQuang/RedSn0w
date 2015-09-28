class ShoesController < ApplicationController
	before_action :authenticate_admin!
	impressionist :actions=>[:index, :show]
	def index
		@category = Category.all
		@shoe = Shoe.all
	end
	def show
		@shoe = Shoe.find(params[:id])
	end
	def new
		@category = Category.all
		@shoe = Shoe.new
	end
	def create
		@shoe = Shoe.new(shoe_params)
		if @shoe.save
			redirect_to admins_path
		else
			render 'new'
		end
	end
	def edit
		@category = Category.all
		@shoe = Shoe.find(params[:id])
	end
	def update
		@shoe = Shoe.find(params[:id])
		if @shoe.update(shoe_params)
			redirect_to admins_path
		else
			render 'edit'
		end
	end
	def destroy
		@shoe = Shoe.find(params[:id])
    	@shoe.destroy
    	redirect_to admins_path
	end
	private
	def shoe_params
		params.require(:shoe).permit(:name, :content, :price, :category_id, :image)
	end
end
