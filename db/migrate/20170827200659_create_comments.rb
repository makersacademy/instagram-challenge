class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :post, index: true
      t.string :comment_text
      t.timestamps
    end
  end
end
