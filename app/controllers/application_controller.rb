class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def current_build
    ItemBuild.find(session[:build_id])
  rescue ActiveRecord::RecordNotFound
    build=ItemBuild.create
    session[:build_id]=build.id
    build
  end
end
