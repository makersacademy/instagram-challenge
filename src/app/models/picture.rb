class Picture < ApplicationRecord
    belongs_to :users, class_name: User
    has_many :comments, :foreign_key => 'picture_id', :class_name => 'Comment'

    # has_one_attached :image do |attachable|
    #     attachable.variant(resize_to_limit: [1080, 1080])

        # "instagram-challenge/src/app/assets/images/#{picture_id}.jpeg"

end
