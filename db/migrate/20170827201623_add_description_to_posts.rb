class AddDescriptionToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :description, :string
  end
end
