class RecipesController < ApplicationController
  def new
    # we need @beer in our `simple_form_for`
    @beer = Beer.find(params[:beer_id])
    @recipe = Recipe.new
  end
 def create
    @recipe = Recipe.new(recipe_params)
    # we need `beer_id` to associate recipe with corresponding beer
    @beer = Beer.find(params[:beer_id])
    @recipe.beer = @beer
    @recipe.save
    redirect_to beer_path(@beer)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:step, :duration, :quantity)
  end
end
