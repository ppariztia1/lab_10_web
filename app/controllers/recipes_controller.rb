class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /recipes
  def index
    @recipes = Recipe.all.includes(:user)
  end

  # GET /recipes/:id
  def show; end

  # GET /recipes/new
  def new
    @recipe = current_user.recipes.build
  end

  # POST /recipes
  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "✅ Recipe created successfully."
    else
      flash.now[:alert] = "❌ Could not create the recipe. Please check the fields."
      render :new, status: :unprocessable_entity
    end
  end

  # GET /recipes/:id/edit
  def edit; end

  # PATCH/PUT /recipes/:id
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "✅ Recipe created successfully."
    else
      flash.now[:alert] = "❌ There was an error updating the recipe."
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "🗑️ Recipe deleted successfully"
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :cook_time, :difficulty, :instructions)
  end
end
