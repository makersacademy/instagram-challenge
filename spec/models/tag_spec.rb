require 'rails_helper'

describe Tag, type: :model do

  let(:post) {double :post, caption: 'Amazing. #jackspoint #queenstown'}

  describe 'find_tag' do
    it 'can find the #tags in a caption' do
      expect(subject.find_tag('Amazing. #jackspoint #queenstown')).to eql ["jackspoint", "queenstown"]
  end
end

end
