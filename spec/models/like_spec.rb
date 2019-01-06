# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  it "has belongs to user" do
    like = described_class.reflect_on_association(:user)
    expect(like.macro).to eq :belongs_to
  end

  it "has belongs to post" do
    like = described_class.reflect_on_association(:post)
    expect(like.macro).to eq :belongs_to
  end
end
