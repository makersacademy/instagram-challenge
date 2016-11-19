class AddCommentedPicturesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :commented_pictures, :integer
  end
end
