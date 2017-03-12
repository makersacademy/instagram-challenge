class AddDescriptionToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :desc, :text
  end
end
