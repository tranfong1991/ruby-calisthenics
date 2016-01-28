class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def name
    @name
  end
  def name=(new_name)
    @name = new_name
  end
  def calories
    @calories
  end
  def calories=(new_calories)
    @calories = new_calories
  end
  def healthy?
    @calories < 200
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(flavor)
    @flavor = flavor
    @calories = 5
    @name = flavor + " jelly bean"
  end
  def flavor
    @flavor
  end
  def flavor=(new_flavor)
    @flavor = new_flavor
  end
  def delicious?
    if @flavor == "licorice"
      return false
    end
    return true
  end
end
