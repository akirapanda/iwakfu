filename= "scripts/recipe_items.csv"

File.open(filename, "r") do |file| 
  last_item_no = "" 
   while line=file.gets
     craft_item_no  = line.split(",")[0].strip.to_s
     name =  line.split(",")[1].strip.to_s
     quantity = line.split(",")[2].strip.to_i
     level = line.split(",")[3].strip.to_i
     skill = line.split(",")[4].strip.to_s
     by_item_no = line.split(",")[5].strip.to_s
     item_count = line.split(",")[6].strip.to_i
     
     @craft_item = Item.where("no=?",craft_item_no)[0]
     @by_item = Item.where("no=?",by_item_no)[0]

     if @craft_item && @by_item
        @recipe = Recipe.where("name = ? and skill = ?",name,skill)[0]
        if @recipe.nil?
          @recipe = Recipe.new
          @recipe.item_id = @craft_item.id
          @recipe.name = name
          @recipe.skill = skill
          @recipe.quantity = quantity
          @recipe.level = level
          @recipe.save
        end
        @recipe_item = RecipeItem.new
        @recipe_item.recipe_id = @recipe.id
        @recipe_item.item_id = @by_item.id
        @recipe_item.quantity = item_count
        @recipe_item.skill = skill
        @recipe_item.save
     else
       puts "#{craft_item_no},#{by_item_no} error!"
     end
   end
end