class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show create edit destroy]
  before_action :strong_params, only: %i[create]

  def index
    @cocktails = Cocktail.all
  end

  def show; end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit; end

  def update
    @cocktail.update(strong_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def strong_params
    params.require(:cocktail).permit(:name)
  end
end
