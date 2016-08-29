class AddMessageToComments < ActiveRecord::Migration
  def change
    add_column :comments, :message, :text
  end
end
