class RecipesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @recipes = Recipe.paginate(page: params[:page], per_page: 10)
    end

    def new
        @recipe = Recipe.new
    end

    def create
        @recipe = current_user.recipes.create(recipe_params)
        redirect_to recipes_path
    end 

    private

    def recipe_params
        params.require(:recipe).permit(:title, :description)
    end

end
