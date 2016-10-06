class CommentsController < ApplicationController
  def create
    @comments = current_user.comments.create(comments_params)\
    if @comments.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end
  def comments_params
    params.require(:post).permit(:text)
  end
end
