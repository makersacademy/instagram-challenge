class AddContributionRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :contribution, foreign_key: true
  end
end
