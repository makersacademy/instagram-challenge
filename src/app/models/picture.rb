class Picture < ApplicationRecord
    belongs_to :users, class_name: User
    has_many :comments, :foreign_key => 'picture_id', :class_name => 'Comment'
    has_one_attached :image
end
