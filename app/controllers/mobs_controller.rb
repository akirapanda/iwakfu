class MobsController < ApplicationController
  def index
    @mobs = Mob.where("hidden =?",false).order("level asc")

    
    @mobs_grid = initialize_grid(@mobs,:per_page => 20)
  end
  
  def show
    @mob = Mob.find(params[:id])
  end
  
  def new
    
  end
  
end