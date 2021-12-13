# frozen_string_literal: true

json.array! @tags, partial: 'v1/tags/tag', as: :tag
