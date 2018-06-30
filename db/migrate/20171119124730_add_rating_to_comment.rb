class AddRatingToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :rating, :integer
  end
end
