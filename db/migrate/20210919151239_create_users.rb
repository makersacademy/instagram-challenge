class CreateUsers < ActiveRecord::Migration[6.1]
  require 'securerandom'

  def change
    create_table :users do |t|
      t.string :handle,
                null: false,
                unique: true
      t.string :email,
                null: false,
                unique: true
      t.string :password_digest
      t.string :settings, null: false, default: ''

      t.timestamps
    end
  end
end
