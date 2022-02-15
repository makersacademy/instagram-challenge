class AddAuthorToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :author, :string
  end
end
