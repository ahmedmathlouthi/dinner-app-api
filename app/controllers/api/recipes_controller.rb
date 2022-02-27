module Api
  class RecipesController < ApplicationController
    def index
      render json: recipes
    end

    private

    def recipes
      @recipes ||= ingredients.present? ? paginated_array : all_recipes.limit(Recipe::PER_PAGE)
    end

    def paginated_array
      @paginated_array ||= Kaminari.paginate_array(sorted_recipes).page(page_params).per(Recipe::PER_PAGE)
    end

    def sorted_recipes
      @sorted_recipes ||= Services::MatchingService.new(
        recipes: all_recipes,
        keys: ingredients
      ).recipes_by_score
    end

    def all_recipes
      @all_recipes ||= Recipe.all
    end

    def page_params
      recipe_params[:page] || 1
    end

    def ingredients
      recipe_params[:keys]&.split(',')
    end

    def recipe_params
      params.permit(:page, :keys)
    end
  end
end
