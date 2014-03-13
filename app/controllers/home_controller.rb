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
          @items = @items.joins(:item_stats).where("item_stats.content = ? and earth = true","伤害").distinct
        elsif damage.include?"fire"
          @items = @items.joins(:item_stats).where("item_stats.content = ? and fire = true","伤害").distinct

        elsif damage.include?"air"
          @items = @items.joins(:item_stats).where("item_stats.content = ? and air = true","伤害").distinct

        elsif damage.include?"water"
          @items = @items.joins(:item_stats).where("item_stats.content = ? and water = true","伤害").distinct
        end
      end
      

      
    end
    
    @items_grid = initialize_grid(@items,:per_page => 40)
    
  end
  
end
