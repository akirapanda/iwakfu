class BuildSharesController < ApplicationController
  def create
    @build_share = BuildShare.new(share_param)
    if @build_share.save
      @build_share.item_build.publish=true
      @build_share.item_build.name = @build_share.name
      @build_share.item_build.content = @build_share.content
      @build_share.item_build.author = @build_share.author
      @build_share.item_build.save
      session[:build_id]=nil
      
      redirect_to @build_share.item_build, notice: '谢谢您的分享'
    else
      render action: 'new'
    end
  end
  
  
  def update
    @build_share = BuildShare.find(params[:id])
    
    if @build_share.update(share_param)
      @build_share.item_build.publish=true
      @build_share.item_build.name = @build_share.name
      @build_share.item_build.content = @build_share.content
      @build_share.item_build.author = @build_share.author
      @build_share.item_build.save
      redirect_to @build_share.item_build, notice: '谢谢您的分享'
    else
      render action: 'edit'
    end
  end
  
  
  def new
    @item_build = ItemBuild.find(params[:build_id])
    if @item_build.nil?
      
    end
    
    
    if @item_build.build_share.nil?
      @build_share = BuildShare.new
      @build_share.item_build = @item_build
    else
      @build_share = @item_build.build_share
    end
  end
  
  private 
  
  def share_param
    params.require(:build_share).permit!
  end

end