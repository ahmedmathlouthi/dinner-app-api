module Services
  class MatchingService
    attr_reader :keys, :recipes

    def initialize(args = {})
      @recipes = args.fetch(:recipes, nil)
      @keys = args.fetch(:keys, nil)
    end

    def recipes_by_score
      return recipes unless keys

      filtered_by_ingredients
    end

    private

    def filtered_by_ingredients
      @filtered_by_ingredients ||= Recipe.order_by_matching_ingredients(sanitized_keys)
    end

    def sanitized_keys
      @sanitized_keys ||= @keys.map { |key| "%#{key}%" }.join(',')
    end
  end
end
