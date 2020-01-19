class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :message
      t.references :user, null: false, foreign_key: true
      t.references :fatcat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
