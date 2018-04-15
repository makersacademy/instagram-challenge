# frozen_string_literal: true

class Photo < ApplicationRecord
  # belongs_to :user
  has_many :likes, dependent: :destroy
  # has_many :comments, dependent: :destroy

  has_attached_file :upload_file,
                    styles: { thumb: ['150x150#'],
                             original: ['500x500>'] }
  validates_attachment_content_type :upload_file, content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
  validates :upload_file, presence: true
  validates :caption, presence: true
end
