class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show, :destroy, :update]

  def index
    @users = User.all
  end

  def show
    @beer = Beer.new
    @design = Design.new
    @article = Article.new
    @beers = Beer.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:photo, :username, :website, activity_ids:[]  )
  end
end
