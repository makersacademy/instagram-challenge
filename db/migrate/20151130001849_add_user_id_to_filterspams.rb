class AddUserIdToFilterspams < ActiveRecord::Migration
  def change
    add_reference :filterspams, :user, index: true, foreign_key: true
  end
end
