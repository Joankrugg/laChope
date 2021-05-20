class StickersController < ApplicationController
  before_action :set_sticker, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @stickers = Sticker.all
    @articles = Article.all
    @beers = Beer.all
    @typical_beers = TypicalBeer.all
  end

  def new
    @user = current_user
    @sticker = Sticker.new
  end

  def create
    @user = current_user
    @sticker = @user.stickers.new(sticker_params)
    @sticker.user = @user
    if
      @sticker.save
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
    if @sticker.update(sticker_params)
      redirect_to sticker_path(@sticker)
    else
      render :edit
    end
  end

  private

  def set_sticker
    @sticker = Sticker.find(params[:id])
  end

  def sticker_params
    params.require(:sticker).permit(:name, :photo)
  end
end
