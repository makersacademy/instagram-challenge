require 'aws-sdk'

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  def identify_image(image=self.image.download)
    output =[]
    aws_connect('eu-west-1')
    client = Aws::Rekognition::Client.new
    detector = client.detect_labels( image: { bytes: image } )
    detector.labels.each { |label| output.push(label.name) }
    return output
  end

  def aws_connect(region)
    Aws.config.update({
    region: region, credentials: Aws::Credentials.new(Rails.application.credentials.aws[:access_key], Rails.application.credentials.aws[:secret_access_key])})
  end

end
