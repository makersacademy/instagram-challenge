class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|

      t.timestamps
    end
  end
end
