class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_stats).where(:hidden=>false).order("level asc")
    if params[:item_type].present?
      @items = @items.where(:item_type=>params[:item_type])
    end
    
    @items_grid = initialize_grid(@items,:per_page => 20)
  end
  
  def show
    @item = Item.find(params[:id])
  end
end