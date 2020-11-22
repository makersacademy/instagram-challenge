class CreateHashTags < ActiveRecord::Migration[6.0]
  def change
    create_table :hash_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
