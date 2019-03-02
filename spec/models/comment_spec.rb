# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has belongs to user" do
    comment = described_class.reflect_on_association(:user)
    expect(comment.macro).to eq :belongs_to
  end

  it "has belongs to post" do
    comment = described_class.reflect_on_association(:post)
    expect(comment.macro).to eq :belongs_to
  end
end
