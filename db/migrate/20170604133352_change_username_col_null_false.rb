class ChangeUsernameColNullFalse < ActiveRecord::Migration[5.1]
  def change
    change_column_null :users, :username, false
  end
end
