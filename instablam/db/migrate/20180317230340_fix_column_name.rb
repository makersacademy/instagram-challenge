class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :commenter, :body
  end
end
