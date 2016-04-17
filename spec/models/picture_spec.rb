require 'rails_helper'

describe Picture, type: :model do

  it { is_expected.to have_many :comments }
  it { is_expected.to belong_to :user }
  
  subject(:pic_no_title) { Picture.create }

  it 'assigns a default title Untitled if no title is given' do
    expect(pic_no_title.title).to eq 'Untitled'
  end
end
