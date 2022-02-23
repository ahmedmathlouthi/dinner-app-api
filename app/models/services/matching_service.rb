module Services
  class MatchingService
    attr_reader :keys, :recipes

    def initialize(args = {})
      @recipes = args.fetch(:recipes, nil)
      @keys = args.fetch(:keys, nil)
    end

    def recipes_by_score
      return recipes unless keys

      render_recipes_with_matching
    end

    private

    def render_recipes_with_matching
      filtered_by_keys.sort_by do |recipe|
        recipe.matching_score(keys)
      end.reverse
    end

    def filtered_by_keys
      @filtered_by_keys ||= Recipe.where("array_to_string(ingredients, '||') ILIKE ANY ( array[?] )", sanitized_keys)
    end

    def sanitized_keys
      @sanitized_keys ||= keys.map { |key| "%#{key}%" }
    end
  end
end
