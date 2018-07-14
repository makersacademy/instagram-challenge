class RemoveBodyFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :body, :text
  end
end
