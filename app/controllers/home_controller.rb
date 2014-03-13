class HomeController < ApplicationController
  def index
  end
  
  def search
     @items = Item.all
    if params[:item_name].present?
      @items = @items.where("name like ?","%"+params[:item_name]+"%")
    end
    
    if params[:attr].present?
      @items = @items.joins(:item_stats).where("item_stats.content in (?)",params[:attr]).distinct
    end
    
    if params[:damage].present?
      params[:damage].each do |damage|
        if damage.include?"earth"
          earth=true
        elsif damage.include?"fire"
          fire=true
        elsif damage.include?"air"
          air=true
        elsif damage.include?"water"
          water=true
        end
        @items = @items.joins(:item_stats).where("item_stats.content = ? and (earth = ? or fire =? or air=? or water=?)","伤害",earth,fire,air,water).distinct
        
      end
    end
    
    @items_grid = initialize_grid(@items,:per_page => 40)
    
  end
  
end
