class RemoveTitleFromPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :title, :string
  end
end
