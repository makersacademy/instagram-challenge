class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :likes

    def like(user_id:, post_id:)
        likes << Like.new(user_id: user_id, post_id: post_id)
    end
end
