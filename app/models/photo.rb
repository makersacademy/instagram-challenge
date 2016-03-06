class Photo < ActiveRecord::Base
  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
  belongs_to :user
  has_many :likes,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy


  has_attached_file :image, :styles => { :original => "1000x1000", :medium => "600x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  FILTERS= %w(_1977 aden brooklyn clarendon earlybird gingham hudson inkwell lark lofi mayfair moon nashville perpetua reyes rise slumber toaster walden willow xpro2)

  def show_filters
    FILTERS.clone
  end

end
