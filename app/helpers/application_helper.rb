module ApplicationHelper
  def current_build
    ItemBuild.find(session[:build_id])
  rescue ActiveRecord::RecordNotFound
    build=ItemBuild.create
    session[:build_id]=build.id
    build
  end
end
