require_relative 'recipe'
require 'csv'

class Cookbook
  attr_reader :recipes, :csv_file
  attr_writer :recipes
  def initialize(csv_path_file)
    @csv_file = csv_path_file
    @recipes = []
    load_csv(@csv_file)
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    # recipe = Recipe.new(name, description)
    # CSV.open(@csv_path_file) do |csv|
    #   csv << [recipe.name, recipe.description]
    # end
    save_csv(@csv_file)
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv(csv_file)
  end

  private

  def load_csv(filepath)
    CSV.foreach(filepath, 'r') do |row|
      row[0] = Recipe.new(row[0], row[1], row[2], row[3])
      @recipes << row[0]
    end
  end

  def save_csv(filepath)
    CSV.open(filepath, 'w') do |csv|
      @recipes.each do |rec|
        csv << [rec.name, rec.description, rec.time, rec.dific]
      end
    end
  end
end
