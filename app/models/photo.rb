class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :picture,
    storage: :s3,
    s3_credentials: {
      bucket: 'instafraudclone',
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/

end
