class HomeController < ApplicationController
  def index
    @q = Item.search(params[:q])
  end
  
  def search
     @q = Item.search(params[:q])
     @items = @q.result(distinct: true)
     @items = @items.where(:hidden=>false).order("level asc")
     @items_grid = initialize_grid(@items,:per_page => 20)
     
    render 'items/index'
  end
  
end
