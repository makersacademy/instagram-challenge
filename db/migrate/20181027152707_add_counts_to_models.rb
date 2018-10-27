class AddCountsToModels < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :followees_count, :integer, :default => 0
  end
end
