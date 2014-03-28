class ItemsController < ApplicationController
  
  def index
    @q = Item.search(params[:q])
    
    @items = Item.includes(:item_stats).includes(:item_type).where(:hidden=>false).order("level asc")
    if params[:item_type].present?
      @items = @items.where(:item_type=>params[:item_type])
    end
    if params[:hand].present?
      if params[:hand].include?"副手"
        @items = @items.where(:second_hand=>true)
      else
        @items = @items.where("double_hand=? or main_hand =?",true,true)
        
      end
    end
    
    @items_grid = initialize_grid(@items,:include=>[:item_stats],:per_page => 20)
  end
    

  def show
    @item = Item.find(params[:id])
    
    
    set_meta_tags :title =>@item.name,
                  :description => @item.content,
                  :keywords => @item.name
  end
end