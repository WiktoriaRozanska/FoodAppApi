class ChangeReferenceInShopListsToUuid < ActiveRecord::Migration[6.0]
  def change
    remove_column  :shop_lists, :user_id
    add_reference :shop_lists, :user, null: true, foreign_key: true, type: :uuid
  end
end
