class AddLikeToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :like, :integer
  end
end
