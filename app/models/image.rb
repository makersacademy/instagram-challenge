class Image < ActiveRecord::Base
    attachment :image
    has_many :comments, dependent: :destroy
    belongs_to :user
end
