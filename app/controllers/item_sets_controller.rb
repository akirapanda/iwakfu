class ItemSetsController < ApplicationController
  def index
    @item_sets = ItemSet.order("level asc")
    @item_sets_grid = initialize_grid(@item_sets,:per_page => 20)
  end

  def show
    @item_set = ItemSet.find(params[:id])
    @items_grid = initialize_grid(@item_set.items,:per_page => 20)  
  end
end