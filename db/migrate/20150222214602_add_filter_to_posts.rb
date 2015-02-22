class AddFilterToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :filter, :string
  end
end
