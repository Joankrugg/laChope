class DesignsController < ApplicationController
  before_action :set_design, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]


  def new
    @user = current_user
    @design = Design.new
  end

  def create
    @design = current_user.build_design(design_params)
    if
      @design.save
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
    if @design.update(design_params)
      redirect_to design_path(@design)
    else
      render :edit
    end
  end
  private

  def set_design
    @design = Design.find(params[:id])
  end

  def design_params
    params.require(:design).permit(:alcohol_shape_id, :design_color_id, :main_taste_id, flavour_ids:[])
  end
end
