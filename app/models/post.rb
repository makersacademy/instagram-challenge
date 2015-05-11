class Post < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy
  has_attached_file :image,
                    :styles => { :medium => "600x600", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => {:bucket => ENV['S3_BUCKET_NAME'],
                                        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                                        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
