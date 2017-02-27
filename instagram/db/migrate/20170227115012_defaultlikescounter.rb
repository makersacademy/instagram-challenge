class Defaultlikescounter < ActiveRecord::Migration[5.0]
  def change
    change_column :likes, :count, :integer, :default => 0
  end
end
