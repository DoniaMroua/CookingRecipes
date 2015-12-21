class IngredientsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  
  def create 
    ingredient = Ingredient.create(ingredient_params)
    respond_with  ingredient
  end


 def index
    respond_with Ingredient.all
  end


  #def show
   # respond_with Ingredient.find(params[:id])
  #end

  private
  def ingredient_params
    params.require(:ingredient).permit(:title)
  end
  
end
