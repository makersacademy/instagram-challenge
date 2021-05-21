class AddUserId < ActiveRecord::Migration[6.1]
  def change
    add_reference :entries, :user, foreign_key: { to_table: :users }
  end
end
