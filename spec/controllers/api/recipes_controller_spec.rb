# spec/controllers/api/v1/recipes_controller_spec.rb

require 'rails_helper'
RSpec.describe Api::RecipesController do
  describe 'GET #index' do
    before do
      FactoryBot.create_list(:recipe, 10)
      get :index
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'JSON body response contains expected recipe attributes' do
      json_response = JSON.parse(response.body)
      expect(json_response.first.keys).to match_array(recipe_attributes)
    end
  end

  def recipe_attributes
    @recipe_attributes ||= %w[
      id
      title
      category
      cuisine
      author
      image
      ingredients
      cook_time
      prep_time
      ratings
      created_at
      updated_at
    ]
  end
end
