class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.text :caption
      t.references :user
      t.timestamps
    end
  end
end
