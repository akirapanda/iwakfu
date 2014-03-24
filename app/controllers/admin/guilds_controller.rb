class Admin::GuildsController < ApplicationController
  def index
    @guilds = Guild.all
    @guild_grid = initialize_grid(@guilds,:per_page => 20)
  end
  
  def show
    @guild = Guild.find(params[:id])
  end
  
  def edit
    @guild = Guild.find(params[:id])
  end
  
  def new
    @guild = Guild.new
  end
  
  def update
    @guild = Guild.find(params[:id])
    if @guild.update(guild_params)
      redirect_to [:admin,@guild]
    else
      render 'edit'
    end
  end
  
  def create
    @guild = Guild.new(guild_params)
    if @guild.save
      redirect_to [:admin,@guild]
    else
      render 'edit'
    end
  end
  
  def destroy
    @guild = Guild.find(params[:id])
    
    @guild.destroy
    respond_to do |format|
      format.html { redirect_to admin_guilds_path }
    end
  end
  private 
  
  def guild_params
    params.require(:guild).permit!
  end
end