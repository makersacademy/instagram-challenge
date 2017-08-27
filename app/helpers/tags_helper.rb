module TagsHelper
  def all_tags_to_string(photo)
    photo.tags.map { |tag| tag.text }.join(" ")
  end
end
