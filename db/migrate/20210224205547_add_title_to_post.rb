class AddTitleToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :title, :string
  end
end
