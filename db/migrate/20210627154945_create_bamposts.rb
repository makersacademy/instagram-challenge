class CreateBamposts < ActiveRecord::Migration[6.1]
  def change
    create_table :bamposts do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
