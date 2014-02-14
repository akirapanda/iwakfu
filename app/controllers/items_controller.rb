class ItemsController < ApplicationController
  def index
    @items_grid = initialize_grid(Item)
  end
  
  def show
    @item = Item.find(params[:id])
  end
end