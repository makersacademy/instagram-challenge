class CreateInsta < ActiveRecord::Migration[5.2]
  def change
    create_table :insta do |t|
      t.text :caption
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
