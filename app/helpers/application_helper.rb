module ApplicationHelper
  def decorate_ingredients(ingredients)
    return ingredients.split(",").map {|ingredient| ingredient.remove(",")}
  end
end
