class DraftsetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_store

  def new
    @draftset = Draftset.new
  end

  def create
    @draftset = @store.build_draftset(draftset_params)
    if @draftset.save
      redirect_to @store
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @draftset.update(draftset_params)
      redirect_to draftset_path(@draftset)
    else
      render :edit
    end
  end

  def destroy
    @draftset.destroy
    redirect_to current_user
  end

  private

  def set_draftset
    @draftset = Draftset.find(params[:id])
  end

  def set_store
    @store = Store.find(params[:store_id])
  end

  def draftset_params
    params.require(:draftset).permit(beer_ids: [])
  end
end
