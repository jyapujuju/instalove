class CommentsController < ApplicationController
  before_action :authenticate_user!,  only: :create
  def create
    @post = Post.find(params[:post_id])
    @comments = current_user.comments.create(comments_params)\
    if @comments.valid?
      redirect_to root_path
    else
      flash[:alert] = "Invalid attributes."
      redirect_to root_paths
    end

  end
  def comments_params
    params.require(:comment).permit(:text, :post_id)
  end
end
