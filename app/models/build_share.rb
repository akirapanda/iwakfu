class BuildShare < ActiveRecord::Base
  belongs_to :item_build
  validates :name,:presence => true
  
  
  def show_tags
    @str=""
    if self.fire
      @str+="火系 "
    end
    if self.air
      @str+="风系 "
    end
    if self.earth
      @str+="土系 "
    end
    if self.water
      @str+="水系 "
    end
    
    if self.tank
      @str+="坦克 "
    end
    if self.dps
      @str+="输出 "
    end
    if self.heal
      @str+="治疗 "
    end
    if self.ect
      @str+="其他 "
    end
    
    if self.qishi
      @str+="骑士 "
    end
    if self.kuangzhan
      @str+="狂战士 "
    end
    if self.zhiliao
      @str+="治愈 "
    end
    if self.zhaohuan
      @str+="召唤 "
    end
    if self.zhiwu
      @str+="植物 "
    end
    if self.xiongmao
      @str+="熊猫 "
    end
    if self.gongjian
      @str+="弓箭 "
    end
    if self.cike
      @str+="刺客 "
    end
    if self.shijian
      @str+="时间法师 "
    end
    if self.baozang
      @str+="宝藏猎人 "
    end
    if self.luckycat
      @str+="幸运猫 "
    end
    @str
  end
end