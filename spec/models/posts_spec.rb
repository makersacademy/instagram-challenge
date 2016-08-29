require 'spec_helper'

describe Post, type: :model do

  it 'is not valid with a description of more than 200 characters' do
    description = 'This description is way too long, and so the validation should make this an invalid description and raise an error to notifying the user to shorten their description content to a maximum of 200 characters.'
    post = Post.new(description: description)
    expect(post).to have(1).error_on(:description)
    expect(post).not_to be_valid
  end

  it 'is not valid with a title of more than 50 characters' do
    post = Post.new(title: 'This title is way too long, it should raise an error')
    expect(post).to have(1).error_on(:title)
    expect(post).not_to be_valid
  end

end
