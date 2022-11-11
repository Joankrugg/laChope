class StoresController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
    @articles = Article.all
    @beers = Beer.all
    @typical_beers = TypicalBeer.all
  end

  def new
    @store = Store.new
  end

  def create
    @user = current_user
    @store = @user.build_store(store_params)
    if @store.save
      redirect_to current_user
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @store.update(store_params)
      redirect_to store_path(@store)
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to current_user
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :city, :address, :privacy_code, :visitor, :market_place_id, :website, beer_ids: [])
  end
end


