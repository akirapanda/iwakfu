class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all

    
    @items_grid = initialize_grid(@items,:per_page => 40)
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_param)
      redirect_to edit_admin_item_path(@item), notice: '修改成功' 
    else
      render 'edit'
    end
  end
  
  private 
  
  def item_param
    params.require(:item).permit!
  end
end