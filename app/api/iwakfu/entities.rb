require 'grape'
module Iwakfu
  module Entities
    class Item < Grape::Entity
      expose :id,:name ,:has_read
      
    end
    

  end
end