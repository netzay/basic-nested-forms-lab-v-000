class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    #this creates the fields on the form automatically
    #Anything in quotes is just a place holder
    @recipe.ingredients.build(name: "Pasta Salad", quantity: "1 cup")
    @recipe.ingredients.build(name: "Pasta Salad 2", quantity: "2 cups")
  end
  
  def create
   #this is taking the stong params method as a argument
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path(@recipe)
  end
 
 
 
  private
 
  def recipe_params
    #these are the params that create take to create a new object and displays them on the show page
    #Name form inputs correctly to create a nested params hash with belongs to and has many associated data.
    params.require(:recipe).permit(:title, ingredients_attributes: [
      :id,
      :name,
      :quantity
      ])  end
end