class AddForeignKeyToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :user, index: true
  end
end
