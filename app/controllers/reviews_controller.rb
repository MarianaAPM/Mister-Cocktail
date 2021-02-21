class ReviewsController < ApplicationController
  def new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review = Review.new(review_params)
    @review.cocktail = @cocktail

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  private
  
  def review_params
    params.require(:review).permit(:content, :user, :rating, :likes)
  end
end
