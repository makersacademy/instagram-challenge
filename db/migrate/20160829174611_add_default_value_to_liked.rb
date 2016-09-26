class AddDefaultValueToLiked < ActiveRecord::Migration
  def change
    change_column :likes, :liked, :boolean, :default => false
  end
end
