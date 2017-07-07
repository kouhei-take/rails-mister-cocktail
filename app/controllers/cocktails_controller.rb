class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    # # .where("cocktail_id = #{@cocktail.id}").first
    # @ingredient = Ingredient.find(@dose.ingredient_id)
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.save
      redirect_to cocktails_path(params[:restaurant_id])
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
