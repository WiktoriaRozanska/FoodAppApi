# frozen_string_literal: true

class V1::Recipes::TagsService
  def self.call(recipe, tags)
    new(recipe, tags).call
  end

  def initialize(recipe, tags)
    @tags = tags
    @recipe = recipe
  end

  def call
    tags.each do |tag|
      recipe.tags << Tag.find_or_initialize_by(name: tag)
    end
  end

  private

  attr_reader :tags, :recipe
end
