class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.datetime :created_at

      t.timestamps
    end
  end
end
