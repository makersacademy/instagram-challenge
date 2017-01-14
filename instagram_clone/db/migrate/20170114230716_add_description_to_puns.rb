class AddDescriptionToPuns < ActiveRecord::Migration[5.0]
  def change
    add_column :puns, :description, :text
  end
end
