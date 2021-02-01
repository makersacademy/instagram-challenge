class Post < ApplicationRecord
    has_one_attached :image
    acts_as_votable
end
