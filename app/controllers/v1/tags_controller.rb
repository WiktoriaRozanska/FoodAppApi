# frozen_string_literal: true

class V1::TagsController < V1Controller
  def index
    @tags = Tag.all
  end
end
