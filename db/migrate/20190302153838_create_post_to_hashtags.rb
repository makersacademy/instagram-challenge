class CreatePostToHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_to_hashtags do |t|
      t.belongs_to :post, index: true
      t.belongs_to :hashtag, index: true
      t.timestamps
    end
  end
end
