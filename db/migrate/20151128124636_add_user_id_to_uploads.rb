class AddUserIdToUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :user, index: true, foreign_key: true
  end
end
