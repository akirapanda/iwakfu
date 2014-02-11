class ItemsController < ApplicationController
  def index
    @items_grid = initialize_grid(Item.all,:per_page => 40)
  end
  
  def show
    
  end
end