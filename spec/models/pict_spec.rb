require 'rails_helper'

RSpec.describe Pict, type: :model do
  let(:user) { build_stubbed(:user) }
  let(:picture) { fixture_file_upload 'spec/docs/images/code_clue.jpg' }
  let(:title) { 'hello?' }
  subject(:pict) {described_class.new(title: title, image: picture, user: user)}

  it 'is valid with picture, title and user' do
    expect(pict).to be_valid
  end

  it 'is not valid without a title' do
    pict.title = nil
    expect(pict).to_not be_valid
  end

  it 'is not valid without a user' do
    pict.user = nil
    expect(pict).to_not be_valid
  end

  it 'is not valid without a picture' do
    pict.image = nil
    expect(pict).to_not be_valid
  end

  it 'is not valid if title does not have a question mark' do
    pict.title = 'helloo'
    expect(pict).to_not be_valid
  end

end
