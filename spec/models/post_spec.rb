require 'rails_helper'
require 'spec_helper'

describe Post, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:comments) }

  it 'description can not be left blank' do
    post = Post.new(name: '')
    expect(post).to have(1).error_on(:name)
    expect(post).not_to be_valid
  end


end
