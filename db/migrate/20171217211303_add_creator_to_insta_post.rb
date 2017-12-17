class AddCreatorToInstaPost < ActiveRecord::Migration[5.1]
  def change
    add_column :insta_posts, :name, :string
  end
end
