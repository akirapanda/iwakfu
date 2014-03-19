require "iwakfu/entities"

module Iwakfu
  class API < Grape::API
    
    prefix "api"
    format :json
    resource :items do
       
       post do
         if not params[:page].present?
          page = 1
         else
          page = params[:page]
         end
         @items = Item.where(:hidden => false).page(page).per(10)
         
         if params[:type_name].present?
            @items = @items.joins(:item_type).where(:hidden => false).where("item_types.chinese_name = ?",params[:type_name])
         end
         
         present @items.includes(:item_type).order("level asc")
         
       end
       post ":id" do
         @item = ItemDetail.where("item_id=?",params[:id])[0]

         present @item
       end

    end
    

    
    
  end
end
