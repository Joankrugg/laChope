class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @feeds = Feed.all
    @user = current_user
    @feed = Feed.new
  end

  def new
    @user = current_user
    @feed = Feed.new
  end

  def create
    @user = current_user
    @feed = @user.feeds.new(feed_params)
    @feed.user = @user
    if
      @feed.save
      redirect_to feeds_path
    else
      redirect_to feeds_path
    end
  end

  def show

  end

  def edit
  end

  def update
    if @feed.update(feed_params)
      redirect_to feed_path(@feed)
    else
      render :edit
    end
  end

  def destroy
    @feed.destroy
    redirect_to feeds_path
  end
  private

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def feed_params
    params.require(:feed).permit(:photo)
  end
end
