class Picture < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.city = geo.city
      obj.country = geo.country_code
    end
  end
  after_validation :reverse_geocode
  belongs_to :user
  has_many :likes,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy
  has_many :comments,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy
end
