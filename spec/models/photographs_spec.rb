require 'spec_helper'

describe Photograph, type: :model do
  it 'is not valid with a name of less than three characters' do
    photograph = Photograph.new(name: "ocean", image_file_name: "text.txt", image_content_type: "text")
    expect(photograph).to have(1).error_on(:image_content_type)
    expect(photograph).not_to be_valid
  end
end
