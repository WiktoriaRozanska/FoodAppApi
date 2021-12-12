class V1::Recipes::StepsService
  def self.call(recipe, steps)
    new(recipe, steps).call
  end

  def initialize(recipe, steps)
    @recipe = recipe
    @steps = steps
  end

  def call
    steps.each do |step|
      recipe.steps << Step.new(description: step, position: recipe.steps.size)
    end
  end

  private
  attr_reader :steps, :recipe
end