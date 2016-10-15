class RemoveLikeFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :like, :integer
  end
end
