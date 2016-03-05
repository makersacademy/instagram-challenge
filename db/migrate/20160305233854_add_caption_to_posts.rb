class AddCaptionToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :caption, :string, limit: 150
  end
end
