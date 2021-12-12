class V1::RecipeService
  def self.call
    new(user, title, comment, cal_per_serv, yields, time, ingredients, steps, tags).call
  end

  def initialize(user, title, comment, cal_per_serv, yields, time, ingredients, steps, tags)
    @user = user
    @title = title
    @comment = comment
    @cal_per_serv = cal_per_serv
    @yields = yields
    @time = time
    @ingredients = ingredients
    @steps = steps
    @tags = tags
  end

  def call
    ActiveRecord::Base.transaction do
      recipe = Recipe.create()
    end
  end

  private
  attr_reader :user, :title, :comment, :cal_per_serv, :yields, :time, :ingredients, :steps, :tags
end