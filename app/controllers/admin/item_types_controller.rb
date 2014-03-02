class Admin::ItemTypesController < ApplicationController
  def index
    @item_types = ItemType.all
    @item_types_grid = initialize_grid(@item_types,:per_page => 40)
  end

  def show
    @item_type = ItemType.find(params[:id])
  end

  def new
    @item_type = ItemType.new
  end
  
  def edit
    @item_type = ItemType.find(params[:id])
  end
  
end