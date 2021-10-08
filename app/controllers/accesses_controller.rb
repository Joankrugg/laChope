class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def new
    @user = current_user
    @access = Access.new
  end

  def create
    @access = current_user.build_access(access_params)
    if
      @access.save
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
    if @access.update(access_params)
      redirect_to access_path(@access)
    else
      render :edit
    end
  end
  private

  def set_access
    @access = Access.find(params[:id])
  end

  def access_params
    params.require(:access).permit(:code)
  end
end
