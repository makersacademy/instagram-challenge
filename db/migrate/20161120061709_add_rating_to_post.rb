class AddRatingToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :rating, :integer
  end
end
