class RemoveColumns < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :comments, :posts_id
  end
end
