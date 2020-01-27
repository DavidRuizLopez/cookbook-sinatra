class Recipe
  attr_reader :name, :description, :done, :time, :dific
  def initialize(name, description, time, dific)
    @name = name
    @description = description
    @done = false
    @time = time
    @dific = dific
  end

  def mark_done
    @done = true
  end
end
