class AddUserIdToMoments < ActiveRecord::Migration
  def change
    add_reference :moments, :user, index: true, foreign_key: true
  end
end
