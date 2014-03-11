class MobsController < ApplicationController
  def index
    @mobs = Mob.order("level asc")

    
    @mobs_grid = initialize_grid(@mobs,:per_page => 40)
  end
  
  def show
    @mob = Mob.find(params[:id])
  end
  
  def new
    
  end
  
end