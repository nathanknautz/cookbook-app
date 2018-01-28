class Recipe < ApplicationRecord
  def friendly_prep_time
    hours = prep_time / 60
    min = prep_time % 60
    time_string = ""
    time_string += "#{hours} #{'Hour'.pluralize(hours)}" if hours > 0
    time_string += ", " if hours > 0 && min > 0
    time_string += "#{min} #{'Minute'.pluralize(min)}" if min > 0
    time_string
    
  end

  def ingredients_list
    ingredients.split(", ")
  end

  def directions_list
    directions.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

end
