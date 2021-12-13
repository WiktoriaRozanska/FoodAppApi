# frozen_string_literal: true

class V1::Pagination
  attr_reader :collection, :start_index, :size

  def self.call(collection, start_index, size)
    new(collection, start_index, size).call
  end

  def initialize(collection, start_index, size)
    @collection = collection
    @start_index = start_index
    @size = size
  end

  def call
    return collection if start_index.blank? || size.blank?

    collection&.indexing(paginated_collection_ids)
  end

  def end_index_or_last_index
    return collection.size - 1 if end_index >= collection.size

    end_index
  end

  def paginated_collection_ids
    collection[start_index..end_index_or_last_index]&.pluck('id')
  end

  def end_index
    start_index + size - 1
  end
end
