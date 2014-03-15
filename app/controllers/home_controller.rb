class HomeController < ApplicationController
  def index
    @q = ItemDetail.search(params[:q])
  end
  
  def search
     @items = Item.all
     
     @search = ItemDetail.search(params[:q])
     @item_details = @search.result(distinct: true)

    @items_grid = initialize_grid(@item_details,:include => [:item],:per_page => 20)
    
  end
  
end
