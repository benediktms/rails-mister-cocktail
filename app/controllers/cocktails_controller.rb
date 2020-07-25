class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[show edit destroy]
  before_action :strong_params, only: %i[create]

  def index
    @cocktails = Cocktail.all
  end

  def show
    # reference for the individual cocktail view. receives the :set_cocktail method
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
      @cocktail.save
    else
      render :new
    end
  end

  def edit
    # reference for the edit view which renders a form(?) to allow the user to edit the cocktail
  end

  def update
    @cocktail.update(strong_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def strong_params
    params.require(:cocktail).permit(:name)
  end
end
