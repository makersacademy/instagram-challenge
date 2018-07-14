class RemoveLikeFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :like, :boolean
  end
end
