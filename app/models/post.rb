require 'aws-sdk'

class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :hashtags
  has_one_attached :image
  validate :image_presence
  after_commit :populate_hashtags, on: :create

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  def populate_hashtags(hashtags=self.identify_image())
    hashtags.each do | label |
      self.hashtags.create(name: label)
    end
  end

  def identify_image(image=self.image.download, client=Aws::Rekognition::Client)
    output =[]
    aws_connect('eu-west-1')
    client = client.new
    detector = client.detect_labels( image: { bytes: image } )
    detector.labels.each { |label| output.push(label.name) }
    return output
  end

  def aws_connect(region)
    Aws.config.update({
    region: region, credentials: Aws::Credentials.new(Rails.application.credentials.aws[:access_key], Rails.application.credentials.aws[:secret_access_key])})
  end

end
