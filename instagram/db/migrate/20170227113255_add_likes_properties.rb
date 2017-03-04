class AddLikesProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :count, :integer
  end
end
