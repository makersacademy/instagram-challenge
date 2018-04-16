class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :commenter
      t.belongs_to :image
      t.timestamps
    end
  end
end
