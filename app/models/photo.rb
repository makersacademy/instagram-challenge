class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_attached_file :picture,
    styles: {
      thumb: '100x100#',
      stream: '640x640#'
    },
    storage: :s3,
    s3_credentials: {
      bucket: 'instafraudnew',
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    }

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/

  def time_ago
    self.created_at.strftime("%d %b '%y - %H:%M")
  end

end
