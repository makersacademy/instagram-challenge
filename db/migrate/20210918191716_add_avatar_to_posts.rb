class AddAvatarToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :avatar, :bytea
  end
  def change
    add_column :users, :avatar, :bytea
  end
end
