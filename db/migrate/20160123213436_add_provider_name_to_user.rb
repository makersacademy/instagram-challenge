class AddProviderNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider_name, :string
  end
end
