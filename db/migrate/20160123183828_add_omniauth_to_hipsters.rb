class AddOmniauthToHipsters < ActiveRecord::Migration
  def change
    add_column :hipsters, :provider, :string
    add_column :hipsters, :uid, :string
  end
end
