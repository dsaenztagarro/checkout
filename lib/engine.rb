# The Engine class represents a stateless rule engine that evaluates pricing
# rules in the context of a basket
class Engine
  attr_reader :result

  # @param [Store] store
  def initialize(store)
    @pricing_rules = store.pricing_rules
    @events = []
  end

  # Fires pricing rules over basket products returning the result
  # @param [Basket] basket
  # @return [Result] the result of the engine execution
  def execute(basket)
    events = @pricing_rules.map { |rule| rule.fire_for(basket) }.compact
    Result.new(events)
  end
end
