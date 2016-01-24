class CreateHipstergrams < ActiveRecord::Migration
  def change
    create_table :hipstergrams do |t|
      t.string :description

      t.timestamps 
    end
  end
end
