class ApplicationController < ActionController::Base

  # Methods that are going to be useful for the whole application
  #
  # The methods we create here are available to all our controllers
  # but are not available to the views by default


  helper_method :current_user, :logged_in?  #based on that - these will be available to our views

  def current_user
    # Memoization -- we will only make the network call the first time and future calls just return the value
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !!something -- the double bang operator transforms everything to boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end

end
