class AddCaptionToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :caption, :string
  end
end
