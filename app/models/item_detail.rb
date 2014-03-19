class ItemDetail < ActiveRecord::Base
  belongs_to :item
  
  
  def set_zero
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