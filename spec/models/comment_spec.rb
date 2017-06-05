require 'rails_helper'

RSpec.describe Comment, type: :model do

  it 'should have a body' do
    comment = create(:comment)
    expect(comment.body).to eq("What a great photo!")
  end

  it { should belong_to(:user) }
  it { should belong_to(:photo) }

end
