class ItemsController < ApplicationController
  def index
    @items = Item.where(:hidden=>false)
    if params[:item_type].present?
      @items = @items.where(:item_type=>params[:item_type])
    end
    
    @items_grid = initialize_grid(@items,:per_page => 40)
  end
  
  def show
    @item = Item.find(params[:id])
  end
end