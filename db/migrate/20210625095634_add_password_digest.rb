class AddPasswordDigest < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t| 
      t.rename :password, :password_digest
    end
  end
end
