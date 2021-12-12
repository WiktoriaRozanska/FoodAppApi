class V1::Recipe::TagsService
  def self.call(recipe, tags)

  end

  def initialize(recipe, tags)
    @tags = tags
    @recipe = recipe
  end

  def call

  end

  private
  attr_reader :tags, :recipe
end
