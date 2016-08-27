class AddMomentIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :moment, index: true, foreign_key: true
  end
end
