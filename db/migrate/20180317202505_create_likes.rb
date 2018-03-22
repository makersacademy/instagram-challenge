class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.belongs_to :photo
      t.belongs_to :user
      t.timestamps
    end
  end
end
