require 'spec_helper'

# RSpec.describe Picture, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Picture, type: :model do

  context 'Comments' do
    it { is_expected.to have_many(:comments) }

    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  context 'Validations' do

    it "picture's name cannot be shorter than 2 characters" do
      picture = Picture.create(name: 'o')
      expect(picture).to have(1).error_on(:name)
      expect(picture).not_to be_valid
    end

    it "picture's name cannot be longer than 100 characters" do
      picture = Picture.create(name: "Maybe this is a wrong test but I want my picture's name not to be longer than one hundred characters.")
      expect(picture).to have(1).error_on(:name)
      expect(picture).not_to be_valid
    end

  end

end
