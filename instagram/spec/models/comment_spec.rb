require 'spec_helper'

describe Comment, type: :model do

  it { is_expected.to belong_to :picture }

  it 'will be deleted when picture is deleted' do
    berries = Picture.create(description: 'berries')
    berries.comments.create(words: 'just great')
    berries.destroy
    expect(Picture.find_by description: 'just great').to equal nil
  end

end
