class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    username, password = session_params.values
    user = User.find_by(username: username)
    if user
      log_in!(user)
      #TODO: redirect somewhere
      render text: "success"
    else
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
