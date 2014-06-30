class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = manufacturers.new(manufacturer_params)

    if @manufacturer.save
      redirect_to manufacturers_path
    else
      flash.now[:notice] = 'Uh oh! Your manufacturer could not be saved.'
      render :new
    end
  end

  def new
    @manufacturer = Manufacturer.new
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
