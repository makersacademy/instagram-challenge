class CreateContributions < ActiveRecord::Migration[5.0]
  def change
    create_table :contributions do |t|
      t.text :comment

      t.timestamps
    end
  end
end
