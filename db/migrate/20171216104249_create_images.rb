class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text :caption
      t.text :imageurl

      t.timestamps
    end
  end
end
