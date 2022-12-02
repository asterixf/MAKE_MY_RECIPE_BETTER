module ApplicationHelper
  def decorate_ingredients(ingredients)
    return ingredients.split(",").map {|ingredient| ingredient.remove(",")}
  end

  def decorate_directions(directions)
    return directions.first.step.split("/").map {|step| step.remove("/")}
  end
end
