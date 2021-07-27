class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @stores = Store.all
    @articles = Article.all
    @beers = Beer.all
    @typical_beers = TypicalBeer.all
  end

  def new
    @user = current_user
    @store = Store.new
  end

  def create
    @store = current_user.build_store(store_params)
    if
      @store.save
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

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :city, :address, :website, beer_ids: [])
  end
end
