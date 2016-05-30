class CreateIrons < ActiveRecord::Migration
  def change
    create_table :irons do |t|

      t.timestamps null: false
    end
  end
end
