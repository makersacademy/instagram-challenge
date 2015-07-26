class AddLikesToImages < ActiveRecord::Migration
  def change
    add_column :images, :likes, :integer, default: 0
  end
end
