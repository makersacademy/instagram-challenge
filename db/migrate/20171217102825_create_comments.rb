class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :picture, index: true
      t.string :content
      t.timestamps
    end
  end
end
