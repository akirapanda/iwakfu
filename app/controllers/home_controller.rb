class HomeController < ApplicationController
  def index
    @q = ItemDetail.search(params[:q])
  end
  
  def search
     @items = Item.where(:hidden=>false)
     
     @search = ItemDetail.search(params[:q])
     @item_details = @search.result(distinct: true)
     @item_details = @item_details.joins(:item).where("items.hidden = false").order("items.level asc")
    @items_grid = initialize_grid(@item_details,:include => [:item],:per_page => 20)
    
  end
  
end
