class AddHipsternameToHipsters < ActiveRecord::Migration
  def change
    add_column :hipsters, :hipstername, :string
    add_index :hipsters, :hipstername, unique: true
  end
end
