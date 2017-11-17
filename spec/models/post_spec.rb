require 'rails_helper'

RSpec.describe Post, :type => :model do
  it "is truthy" do
    expect(Post.new.return_true).to eq true
  end
  end
