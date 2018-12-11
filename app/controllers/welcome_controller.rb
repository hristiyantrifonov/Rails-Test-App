class WelcomeController < ApplicationController

  # The home action
  def home
    redirect_to articles_path if logged_in?
  end

  # The about action
  def about

  end

end
