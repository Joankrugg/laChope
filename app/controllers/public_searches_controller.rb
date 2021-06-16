class PublicSearchesController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @public_search = PublicSearch.new
  end

  def create
    @public_search = PublicSearch.new(public_search_params)
    if
      @public_search.save
      redirect_to public_search_path (@public_search)
    else
      render :new
    end
  end

  def show
    @public_search = PublicSearch.find(params[:id])
  end

  private

  def public_search_params
    params.require(:public_search).permit(:category_id, :balance_id, :alcohol_shape_id, :design_color_id, :main_taste_id)
  end
end
