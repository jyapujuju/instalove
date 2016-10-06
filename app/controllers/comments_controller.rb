class CommentsController < ApplicationController
  before_action :authenticate_user!,  only: :create

  # def index
  #   @post = Post.find(params[:post_id])
  #   @comments = Post.find(params[:id])
  # end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.create(comments_params)
    if @comments.valid?
      redirect_to root_path
    else
      flash[:alert] = "Invalid attributes."
      redirect_to root_path
    end
  end

  def destroy
      Comment.find(params[:id]).destroy
      redirect_to root_path
  end

  def comments_params
    params.require(:comment).permit(:text, :post_id).merge(user_id: current_user.id)
  end

end
