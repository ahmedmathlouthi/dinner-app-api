class Recipe < ApplicationRecord
  PER_PAGE = 10

  validates :ingredients, length: {
    maximum: 1,
    message: 'At least one ingredient'
  }

  # TODO: in case we want to get the exact matching score to get higher precision

  # def matching_score(keys)
  #   score = 0
  #   ingredients.each do |ingredient|
  #     score += 1 if ingredient_contains_key(ingredient, keys)
  #   end
  #   ((score.to_f / ingredients.length)).to_i
  # end

  # private

  # def ingredient_contains_key(ingredient, keys)
  #   keys.any? { |key| key.in?(ingredient) }
  # end
end
