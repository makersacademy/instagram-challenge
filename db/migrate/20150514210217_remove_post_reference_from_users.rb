class RemovePostReferenceFromUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :post, index: true, foreign_key: true
  end
end
