class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|

      t.timestamps
    end
  end
end
