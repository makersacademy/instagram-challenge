class AddBodyToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :body, :text
  end
end
