class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionHelper

  def logged_in_user
    if !logged_in?
      flash[:danger]="Please Log in"
      redirect_to root_url
    end
  end


  def already_liked?(u,b)
    Like.where(user_id:u,blog_id:b).exists?
  end
  
end
