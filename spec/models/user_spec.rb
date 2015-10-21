require 'rails_helper'

describe User do

  it {is_expected.to have_many :liked_posts}

  it "has comments" do
    user = create :user
    expect(user.comments).to eq []
  end

end
