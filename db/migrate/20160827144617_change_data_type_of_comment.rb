class ChangeDataTypeOfComment < ActiveRecord::Migration
  def up
    change_column :comments, :comment, :string
  end

  def down
    change_column :comments, :comment, :text
  end
end
