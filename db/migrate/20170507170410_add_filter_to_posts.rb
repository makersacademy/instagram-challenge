class AddFilterToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :filter, :string
  end
end
