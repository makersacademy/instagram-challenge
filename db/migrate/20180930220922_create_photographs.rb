class CreatePhotographs < ActiveRecord::Migration[5.2]
  def change
    create_table :photographs do |t|
      t.references :user, foreign_key: true
      t.string :aws_key

      t.timestamps
    end
  end
end
