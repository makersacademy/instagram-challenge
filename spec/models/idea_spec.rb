require 'rails_helper'

RSpec.describe Idea, type: :model do

  it 'has a name and description ' do
    idea = Idea.create!(name: 'Post title')
    second_idea = Idea.create!(name: 'Second Post Title')
    expect(idea.name).to eq('Post title')
  end

  it 'creates different ideas ' do
    idea = Idea.create!(name: 'Post title')
    second_idea = Idea.create!(name: 'Second Post Title')
    expect(second_idea.name).to eq('Second Post Title')
  end
end
