class Tag < ApplicationRecord
  has_many :posts, through: :post_tags
  has_many :post_tags, dependent: :destroy

  def find_tag(caption)
    return @tags = caption.scan(/(?<=#)\w+/)
  end

end
