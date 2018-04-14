# frozen_string_literal: true

class Photo < ApplicationRecord
  # belongs_to :user
  # has_many :likes, dependent: :destroy
  # has_many :comments, dependent: :destroy

  has_attached_file :upload_file,
                    styles: { thumb: ['100x100#'],
                             original: ['500x500>'] }
  validates_attachment_content_type :upload_file, content_type: /\Aimage\/.*\z/
  # validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  # validates_attachment :image, :presence => true, :content_type => { :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }
end
