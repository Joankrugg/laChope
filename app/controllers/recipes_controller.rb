class RecipesController < ApplicationController
  before_action :get_beer
  before_action :set_recipe, only: [:edit, :update]
  def new
    # we need @beer in our `simple_form_for`
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

  def edit

  end

  def update
    if @recipe.update(recipe_params)
       @recipe.beer = @beer
      redirect_to beers_path(@beer)
    else
      render :edit
    end
  end

  private

  def get_beer
    @beer = Beer.find(params[:beer_id])
  end

  def set_recipe
    @recipe = @beer.recipes.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:step, :duration, :quantity, :temperature, :unit_id, :action_id, :duration_unit_id, :product)
  end
end
