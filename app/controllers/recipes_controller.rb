class RecipesController < ApplicationController
  
  before_filter :authenticate_user!, only: [:create, :update]
  
  
  def index
   # recipes = Recipe.all           
    @recipes = Recipe.paginate(:page => params[:page], :per_page => 10)
    respond_with @recipes
  end

  def create
    respond_with Recipe.create(recipe_params.merge(user_id: current_user.id))
    #respond_with Recipe.create(recipe_params)
    
  end

  #def show
   # respond_with Recipe.find(params[:id])
  #end

 def update
    recipe= Recipe.find(params[:id])
    respond_with recipe.update(rate:params[:rate])
  end
  
  def as_json(options = {})
    super(options.merge(include: :user))
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:description, :title, :publication_date, :rate, :image)
  end
end
  

