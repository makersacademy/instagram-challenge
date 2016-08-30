class CreateMewments < ActiveRecord::Migration[5.0]
  def change
    create_table :mewments do |t|
      t.string :caption

      t.timestamps
    end
  end
end
