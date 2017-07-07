class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)
    # @dose = Dose.new(dose_params)
    # @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render "doses/new"
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end

#
# def create
#   @review = Review.new(review_params)
#   @restaurant = Restaurant.find(params[:restaurant_id])
#   @review.restaurant = Restaurant.find(params[:restaurant_id])
# end
