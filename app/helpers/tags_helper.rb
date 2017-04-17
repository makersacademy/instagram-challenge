module TagsHelper
  def create_tag photo, input_params
    string_of_tags = input_params['phrase']
    array_of_tags = string_of_tags.split(' ')
    array_of_tags.each do |t|
      tag = Tag.find_or_initialize_by('phrase' => t)
      photo.tags << tag
    end
  end
end
