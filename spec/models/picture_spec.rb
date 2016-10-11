require 'rails_helper'

describe Picture do

  let(:picture) {Picture.new({title: "Wild ducks", likes: "20"})}

  describe 'Show likes' do

    before(:each) do
      picture.save
    end

    it 'should return the number of likes' do
      expect(picture.show_likes).to eq(20)
    end

  end

end
