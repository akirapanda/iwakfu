require "iwakfu/entities"
require 'rack/contrib'

module Iwakfu
  class API < Grape::API
    use Rack::JSONP
    
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
         
         if params[:name].present?
           @items = @items.joins(:item_type).where(:hidden => false).where("items.name like ?","%"+params[:name]+"%")
         end
         
         present @items.includes(:item_type).order("level asc")
         
       end
       
       get do
         if not params[:page].present?
          page = 1
         else
          page = params[:page]
         end
         @items = Item.where(:hidden => false).page(page).per(10)
         
         if params[:type_name].present?
            @items = @items.joins(:item_type).where(:hidden => false).where("item_types.chinese_name = ?",params[:type_name])
         end
         
         if params[:name].present?
           @items = @items.joins(:item_type).where(:hidden => false).where("items.name like ?","%"+params[:name]+"%")
         end
         
         present @items.includes(:item_type).order("level asc")
         
       end
       
       post ":id" do
         @item = ItemDetail.where("item_id=?",params[:id])[0]
         
         present @item
       end

       get ":id" do
         @item = ItemDetail.where("item_id=?",params[:id])[0]
         
         present @item
       end
       
    end
    


    resource :item_stats do
      post ":id" do
        @stats = ItemStat.where("item_id=?",params[:id]).order("cate desc")
        
        present @stats
      end
    end
  end
end
