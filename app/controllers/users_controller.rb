class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in!(user)
      #TODO: Redirect somewhere
      render text: "success"
    else
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
