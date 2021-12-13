# frozen_string_literal: true

class V1::TagsController < V1Controller
  def index
    byebug
    @tags = Tag.all
  end
end
