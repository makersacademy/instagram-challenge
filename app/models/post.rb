class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :comments, dependent: :destroy
  validates :image, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def tag_names
  ''
  end

  def tag_names=(tag_names)
    return nil if tag_names == ''
      tag_names.split(', ').each do |tag_name|
        formatted_name = '#'+tag_name.delete('#')
        tag = Tag.find_or_create_by(name: formatted_name)
        tags << tag
  end


end

end
