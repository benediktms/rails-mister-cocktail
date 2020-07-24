class DosesController < ApplicationController
  before_action :strong_params, only: :create
  before_action :find_cocktail, only: %i[new create]

  def show
    @dose = Dose.find(params[:id])
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(strong_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
