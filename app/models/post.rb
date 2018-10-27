# frozen_string_literal: true

class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  
  acts_as_likeable
  acts_as_mentioner
end
