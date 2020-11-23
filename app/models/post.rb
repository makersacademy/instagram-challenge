class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :likes
    validates_presence_of :caption
    validates_presence_of :user_id
    validates_presence_of :image

    def like(user_id:, post_id:)
        likes << Like.new(user_id: user_id, post_id: post_id)
    end
end
