class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :post_id
      t.string :user_id
      t.string :content
      
      t.timestamps
    end
  end
end
