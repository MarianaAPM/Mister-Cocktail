class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end
  
  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end

  end

  def edit
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end
  
  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
