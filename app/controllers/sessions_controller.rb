class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) # since all our emails are stored in downcase

    if user && user.authenticate(params[:session][:password])

      # to simulate login we are storing the user id in the session hash, and then the cookies take care of it
      # It will be stored by the browser and used for request
      session[:user_id] = user.id

      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else
      # flash now should in such cases, since the rendering this is not considered new request
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end

end