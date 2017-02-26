class CreateWoofs < ActiveRecord::Migration[5.0]
  def change
    create_table :woofs do |t|
      t.boolean :visible

      t.timestamps
    end
  end
end
