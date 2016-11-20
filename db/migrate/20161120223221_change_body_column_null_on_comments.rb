class ChangeBodyColumnNullOnComments < ActiveRecord::Migration[5.0]
  def change
    change_column_null :comments, :body, false
  end
end
