class UsersController < ApplicationControllerdef show
  def show
    @user = User.find(params[:id])
  end
end
