class AddUserForeignKeyToPictures < ActiveRecord::Migration[5.1]
  def change
    change_table :pictures do |t|
      t.references :user, index: true
    end

    change_table :comments do |t|
      t.references :user, index: true
    end
  end
end
