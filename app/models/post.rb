class Post < ApplicationRecord
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }, s3_credentials: {
    bucket: 'mashagramm',
    access_key_id: Rails.application.secrets.s3_access_key,
    secret_access_key: Rails.application.secrets.s3_secret_key,
    s3_region: 'eu-west-2',
    s3_host_name: 's3-eu-west-2.amazonaws.com',
    url: ':s3_host_name'
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
