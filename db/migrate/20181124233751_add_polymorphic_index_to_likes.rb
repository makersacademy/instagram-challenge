class AddPolymorphicIndexToLikes < ActiveRecord::Migration[5.1]
  add_index :likes, [:likeable_type, :likeable_id, :user_id], unique: true
end
