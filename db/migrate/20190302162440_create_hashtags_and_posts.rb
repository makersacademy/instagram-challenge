class CreateHashtagsAndPosts< ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_posts, id: false do |t|
      t.integer :hashtag_id
      t.integer :post_id
    end
  end
end
