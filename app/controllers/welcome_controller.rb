class WelcomeController < ApplicationController
  def index
    # @current_user = User.find_by(id: session[:user_id])
  end

  def about_author
    render :about_author
  end

  def contact_me
    render :contact_me
  end
end