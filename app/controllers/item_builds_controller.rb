class ItemBuildsController < ApplicationController
  def new
    @item_build = current_build
    @headers = Item.where("item_type=?","头盔")
    @shoulders = Item.where("item_type=?","肩甲")
    @necks = Item.where("item_type=?","项链")
    @left_rings = Item.where("item_type=?","戒指")
    @right_rings = Item.where("item_type=?","戒指")
    
    @bodys = Item.where("item_type=?","胸甲")
    @foots = Item.where("item_type=?","靴子")
    @cloaks = Item.where("item_type=?","披风")
    @belts = Item.where("item_type=?","腰带")
    
    weapons=["斧","魔杖","单手剑","铲","匕首","单手杖","锤子","针","弓","双手剑","双手杖","卡牌","盾牌"]
    @left_hands = Item.where("item_type in (?)",weapons)
    @right_hands = Item.where("item_type in (?)",weapons)
    
  end
  
  def add_item
    @item_build = current_build
    @item = Item.find(params[:item_id])
    @item_build.add_item(@item,params[:side])
    @item_build.save
  end
  
  def show_build
    @item_build = ItemBuild.new  
    if params[:header_id].present?  &&  !params[:header_id].blank?
      header = Item.includes(:item_detail).find(params[:header_id])
      @item_build.add_item_stats(header)
    end
    if params[:shoulder_id].present? &&  !params[:shoulder_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:shoulder_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:neck_id].present?  &&  !params[:neck_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:neck_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:left_ring_id].present? &&  !params[:left_ring_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:left_ring_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:right_ring_id].present? &&  !params[:right_ring_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:right_ring_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:body_id].present? &&  !params[:body_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:body_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:foot_id].present? &&  !params[:foot_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:foot_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:cloak_id].present? &&  !params[:cloak_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:cloak_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:belt_id].present? &&  !params[:belt_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:belt_id])
      @item_build.add_item_stats(shoulder)
    end
    
    if params[:left_hand_id].present? &&  !params[:left_hand_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:left_hand_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:right_hand_id].present? &&  !params[:right_hand_id].blank?
      shoulder = Item.includes(:item_detail).find(params[:right_hand_id])
      @item_build.add_item_stats(shoulder)
    end
      
    if params[:pet_id].present?
      shoulder = Item.includes(:item_detail).find(params[:pet_id])
      @item_build.add_item_stats(shoulder)
    end
    if params[:medal_id].present?
      shoulder = Item.includes(:item_detail).find(params[:medal_id])
      @item_build.add_item_stats(shoulder)
    end
    
    
    
    
    
    
    
    
    
    render :json => @item_build
  end
  
end