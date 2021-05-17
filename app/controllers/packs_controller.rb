class PacksController < ApplicationController
  def new
    @pack = Pack.new
  end

  def create
    @pack = Pack.new(pack_params)
    if
      @pack.save
      redirect_to pack_path(@pack)
    else
      render :new
    end
  end

  def show
   @pack = Pack.find(params[:id])
  end

  private

  def pack_params
    params.require(:pack).permit(:name, :bottle_numbers, :bottle_id)
  end
end
