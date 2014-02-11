class MobFamiliesController < ApplicationController
  def index
    @mob_families_grid = initialize_grid(MobFamily.all,:per_page => 40)
  end
  
  def show
    @mob_family = MobFamily.find(params[:id])

  end
  
  def new
    @mob_family = MobFamily.new
  end
  
  def create
    
    @mob_family = MobFamily.new(mob_family_params)
    
    respond_to do |format|
      if @mob_family.save
        
        format.html { redirect_to @mob_family, notice: 'Mob Family was successfully created.' }
      else
        format.html { render 'new' }
      end
    end
  end
  
  
  private
  
  def mob_family_params
    params.require(:mob_family).permit!
  end
end