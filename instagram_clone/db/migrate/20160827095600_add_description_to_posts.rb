class AddDescriptionToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :description, :text
  end
end
