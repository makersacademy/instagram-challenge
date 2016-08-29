class ChangeNames < ActiveRecord::Migration
  def change
    rename_table :photos, :posts
  end
end
