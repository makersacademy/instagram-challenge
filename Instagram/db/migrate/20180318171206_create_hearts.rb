class CreateHearts < ActiveRecord::Migration[5.1]
  def change
    create_table :hearts do |t|
      t.belongs_to :image
      t.timestamps
    end
  end
end
