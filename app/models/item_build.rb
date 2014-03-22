class ItemBuild < ActiveRecord::Base

  belongs_to :header  ,:class_name => "Item", :foreign_key => "header_id"  
  belongs_to :body  ,:class_name => "Item", :foreign_key => "body_id"  
  belongs_to :neck  ,:class_name => "Item", :foreign_key => "neck_id"  
  
  belongs_to :shoulder  ,:class_name => "Item", :foreign_key => "shoulder_id"  
  belongs_to :left_ring  ,:class_name => "Item", :foreign_key => "left_ring_id"  
  belongs_to :right_ring  ,:class_name => "Item", :foreign_key => "right_ring_id"  
  
  belongs_to :foot  ,:class_name => "Item", :foreign_key => "foot_id"  
  belongs_to :cloak  ,:class_name => "Item", :foreign_key => "cloak_id"  
  belongs_to :belt,:class_name => "Item", :foreign_key => "belt_id"
  belongs_to :left_hand,:class_name => "Item", :foreign_key => "left_hand_id"
  belongs_to :right_hand,:class_name => "Item", :foreign_key => "right_hand_id"
  
  
  
  has_many :item_build_bonus_items
  has_many :item_set_details, through: :item_build_bonus_items
  has_one :build_share

  def add_set_bouns
    set_zero
    add(self.header) if self.header
  end
  
  def remove_item(part)
    case part
      
    when 'header'
      self.header_id = nil
    when 'neck'
      self.neck_id = nil
    when 'shoulder'
      self.shoulder_id = nil
    when 'body'
      self.body_id = nil
    when 'belt'
      self.belt_id = nil
    when 'foot'
      self.foot_id = nil
    when 'cloak'
      self.cloak_id = nil
    when 'left_ring'
      self.left_ring_id = nil
    when 'right_ring'
      self.right_ring_id = nil
    when 'left_hand'
      self.left_hand_id = nil
    when 'right_hand'
      self.right_hand_id = nil
    end
    
    cal_stats
  end
  
  def add_item(item,side)
    if item.item_type.chinese_name.include?("头盔")
      self.header = item
    end
    if item.item_type.chinese_name.include?("胸甲")
      self.body = item
    end
    if item.item_type.chinese_name.include?("项链")
      self.neck = item
    end 
    if item.item_type.chinese_name.include?("肩甲")
      self.shoulder = item
    end
    if item.item_type.chinese_name.include?("腰带")
      self.belt = item
    end
    if item.item_type.chinese_name.include?("靴子")
      self.foot = item
    end
    if item.item_type.chinese_name.include?("披风")
      self.cloak = item
    end
    
    
    if item.item_type.chinese_name.include?("戒指")
      if side
        if side=="left"
          self.left_ring = item
        else
          self.right_ring = item
        end
      else
        self.right_ring = item
      end
    end
    
    if Item::WEAPONS.include?(item.item_type.chinese_name)
      if side
        if side =="left"
          self.left_hand = item
        else
          self.right_hand = item
        end
      else
        self.right_hand = item
      end
    end
    cal_stats
    
  end
  
  
  def cal_bonus
    set_and_pieces = []
    
    items_id = []
    items_id << self.header.id if self.header
    items_id << self.neck.id if self.neck
    items_id << self.body.id if self.body
    items_id << self.shoulder.id if self.shoulder
    items_id << self.belt.id if self.belt
    items_id << self.foot.id if self.foot
    items_id << self.cloak.id if self.cloak
    items_id << self.left_ring.id if self.left_ring
    items_id << self.right_ring.id if self.right_ring
    items_id << self.left_hand.id if self.left_hand
    items_id << self.right_hand.id if self.right_hand
    sets = []
    sets << self.header.item_set.id if self.header && self.header.item_set
    sets << self.neck.item_set.id if self.neck && self.neck.item_set
    sets << self.body.item_set.id if self.body && self.body.item_set
    sets << self.shoulder.item_set.id if self.shoulder && self.shoulder.item_set
    sets << self.belt.item_set.id if self.belt && self.belt.item_set
    sets << self.foot.item_set.id if self.foot && self.foot.item_set
    sets << self.cloak.item_set.id if self.cloak && self.cloak.item_set
    sets << self.left_ring.item_set.id if self.left_ring && self.left_ring.item_set
    sets << self.right_ring.item_set.id if self.right_ring && self.right_ring.item_set
    sets << self.left_hand.item_set.id if self.left_hand && self.left_hand.item_set
    sets << self.right_hand.item_set.id if self.right_hand && self.right_hand.item_set
    
    
    sets_id = sets.uniq
    self.item_build_bonus_items.destroy_all
    
    sets_id.each do |set_id|
      items = Item.where("item_set_id = ? ",set_id)
      count = 0
      items.each do |item|
        if items_id.include?item.id
          count = count + 1
        end
      end    
      set_and_piece = {}
      set_and_piece[:set_id]=set_id
      set_and_piece[:piece]=count
      set_and_pieces<<set_and_piece
    end
    
    set_and_pieces.each do |set_and_piece|
       set_id = set_and_piece[:set_id]
       piece = set_and_piece[:piece]
       item_set_details = ItemSetDetail.where("item_set_id = ? and piece <= ?",set_id,piece)
       
       item_set_details.each do |detail|
         self.item_set_details << detail
         self.add_item_set_bonus_stat(detail)
      end 
    end
  end
  
  def cal_stats
    set_zero
    
    
    self.add_item_stats(self.header)
    self.add_item_stats(self.body)
    self.add_item_stats(self.neck)
    self.add_item_stats(self.shoulder)
    self.add_item_stats(self.left_ring)
    self.add_item_stats(self.right_ring)
    
    self.add_item_stats(self.foot)
    self.add_item_stats(self.cloak)
    self.add_item_stats(self.belt)
    self.add_item_stats(self.left_hand)
    self.add_item_stats(self.right_hand)
    
    cal_bonus
  end
  
  def add_item_set_bonus_stat(bonus_detail)
    if bonus_detail
      self.add_stat(bonus_detail)
    end
  end
  
  def add_item_stats(item)    
    if item
      puts "#{item.level},#{self.min_level}"
      self.min_level = item.level if item.level < self.min_level || min_level==0
      self.max_level = item.level if item.level > self.max_level
    end
    
    if item && item.item_detail
      item_detail = item.item_detail
            
      self.add_stat(item_detail)
    end
  end
  
  def add_stat(item_detail)
    self.hp = self.hp + item_detail.hp.to_i
    self.ap = self.ap + item_detail.ap.to_i
    self.mp = self.mp + item_detail.mp.to_i
    self.wp = self.wp + item_detail.wp.to_i
    self.initiative = self.initiative + item_detail.initiative.to_i
    self.dodge = self.dodge + item_detail.dodge.to_i
    self.lock = self.lock + item_detail.lock.to_i
    self.backstab = self.backstab + item_detail.backstab.to_i
    self.critical = self.critical + item_detail.critical.to_i
    self.crit_damage = self.crit_damage + item_detail.crit_damage.to_i
    self.crit_fail = self.crit_fail + item_detail.crit_fail.to_i
    
    
    self.block = self.block + item_detail.block.to_i
    self.control = self.control + item_detail.control.to_i
    self.cmc = self.cmc + item_detail.cmc.to_i
    self.will_power = self.will_power + item_detail.will_power.to_i
    self.prospecting = self.prospecting + item_detail.prospecting.to_i
    self.perception = self.perception + item_detail.perception.to_i
    self.heals = self.heals + item_detail.heals.to_i
    self.wisdom = self.wisdom + item_detail.wisdom.to_i
    self.range  = self.range + item_detail.range.to_i
    self.remove_ap  = self.remove_ap + item_detail.remove_ap.to_i

    self.fire_damage = self.fire_damage + item_detail.fire_damage.to_i
    self.earth_damage = self.earth_damage + item_detail.earth_damage.to_i
    self.water_damage = self.water_damage + item_detail.water_damage.to_i
    self.air_damage = self.air_damage + item_detail.air_damage.to_i
    self.fire_resist = self.fire_resist + item_detail.fire_resist.to_i
    self.earth_resist = self.earth_resist + item_detail.earth_resist.to_i
    self.water_resist = self.water_resist + item_detail.water_resist.to_i
    self.air_resist = self.air_resist + item_detail.air_resist.to_i
    self.fire_skill = self.fire_skill + item_detail.fire_skill.to_i
    self.earth_skill = self.earth_skill + item_detail.earth_skill.to_i
    self.water_skill = self.water_skill + item_detail.water_skill.to_i
    self.air_skill = self.air_skill + item_detail.air_skill.to_i
    self.fire = self.fire + item_detail.fire.to_i
    self.water = self.water + item_detail.water.to_i
    self.earth = self.earth + item_detail.earth.to_i
    self.air = self.air + item_detail.air.to_i
    self.remove_ap = self.remove_ap + item_detail.remove_ap.to_i
    self.crit_resist = self.crit_resist + item_detail.crit_resist.to_i
    self.ap_resist = self.ap_resist + item_detail.ap_resist.to_i
    self.mp_resist = self.mp_resist + item_detail.mp_resist.to_i
    self.back_resist = self.back_resist + item_detail.back_resist.to_i
    self.heals_resist = self.heals_resist + item_detail.heals_resist.to_i
  end
  
  def set_zero
    self.min_level=0
    self.max_level=0
    self.hp = 0
    self.ap = 0
    self.mp = 0
    self.wp = 0
    self.initiative = 0
    self.dodge = 0
    self.lock = 0
    self.backstab = 0
    self.critical = 0
    self.crit_damage = 0
    
    self.crit_fail = 0
    
    self.block = 0
    self.control = 0
    self.cmc = 0 
    self.will_power = 0
    self.prospecting = 0
    self.perception = 0
    self.heals = 0
    self.wisdom = 0
    self.range  = 0
    self.remove_ap  = 0

    self.fire_damage = 0
    self.earth_damage = 0
    self.water_damage = 0
    self.air_damage = 0
    self.fire_resist = 0
    self.earth_resist = 0
    self.water_resist = 0
    self.air_resist = 0
    self.fire_skill = 0
    self.earth_skill = 0
    self.water_skill = 0
    self.air_skill = 0
    self.fire = 0
    self.water = 0
    self.earth = 0
    self.air = 0
    
    self.remove_ap = 0
    self.crit_resist  = 0
    self.ap_resist = 0
    self.mp_resist = 0
    self.back_resist  = 0
    self.heals_resist  = 0
    
  end
end