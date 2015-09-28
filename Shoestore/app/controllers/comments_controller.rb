class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
    @shoe = Shoe.find(params[:shoe_id])
    @comment = @shoe.comments.create(comment_params)
    redirect_to user_path(@shoe)
  end
	private
    def comment_params
      params.require(:comment).permit(:commenter, :content)
    end
end
