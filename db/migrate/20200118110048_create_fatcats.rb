class CreateFatcats < ActiveRecord::Migration[6.0]
  def change
    create_table :fatcats do |t|
      t.text :caption

      t.timestamps
    end

  end
end
