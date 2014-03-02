class Admin::ItemTypesController < ApplicationController
  def index
    @item_types = ItemType.all
    
    @item_types_grid = initialize_grid(@item_types,:per_page => 40)
    
  end

end