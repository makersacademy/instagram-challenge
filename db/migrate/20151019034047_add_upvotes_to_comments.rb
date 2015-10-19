class AddUpvotesToComments < ActiveRecord::Migration
  def change
    add_column :comments, :upvotes, :integer
  end
end
