# frozen_string_literal: true

# Post
class Post < ApplicationRecord
  belongs_to :user
  acts_as_commontable
  acts_as_votable
end
