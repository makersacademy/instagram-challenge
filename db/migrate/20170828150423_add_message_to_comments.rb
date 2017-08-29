class AddMessageToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :message, :text
  end
end
