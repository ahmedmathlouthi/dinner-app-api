class Recipe < ApplicationRecord
  PER_PAGE = 9

  def self.order_by_matching_ingredients(keys)
    find_by_sql("
      SELECT r.id,
        r.title,
        r.ingredients,
        r.author,
        r.image
        FROM recipes AS r
        CROSS JOIN unnest ('{#{keys}}'::text[]) AS ingredients_list
        WHERE array_to_string(r.ingredients, '||') LIKE ingredients_list
        GROUP BY r.id, r.ingredients
        ORDER BY array_length(array_agg(ingredients_list), 1) DESC ;
      ")
  end
end
