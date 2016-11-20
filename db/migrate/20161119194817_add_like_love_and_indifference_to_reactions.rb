class AddLikeLoveAndIndifferenceToReactions < ActiveRecord::Migration[5.0]
  def change
    add_column :reactions, :like, :boolean
    add_column :reactions, :love, :boolean
    add_column :reactions, :indifference, :boolean
  end
end
