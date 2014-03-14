class ItemDetailsController < ApplicationController
  def show
    @item_detail = ItemDetail.find(params[:id])
  end
  

end