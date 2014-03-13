class HomeController < ApplicationController
  def index
  end
  
  def search
    if params[:item_name].present?
      @items = Item.where("name like ?","%"+params[:item_name]+"%")
      @items_grid = initialize_grid(@items,:per_page => 40)
    end
    
  end
  
end
