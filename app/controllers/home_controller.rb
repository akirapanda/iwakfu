class HomeController < ApplicationController
  def index
  end
  
  def search
    if params[:item_name].present?
      @items = Item.where("name like ?","%"+params[:item_name]+"%")
    end
  end
  
end
