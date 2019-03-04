class DropResources < ActiveRecord::Migration[5.2]
  def change
    drop_table :resources
  end
end
