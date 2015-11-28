require 'rails_helper'

feature 'Comments' do
  let!(:post){Post.create(image: File.new(Rails.root + 'spec/fixtures/images/example.png'),
                          caption: '#chilling')}
  let!(:user){User.create(email: 'dan@example.com',
                          password: 'Hell0World!')}
  before do
    login(user)
  end

  scenario "Posts have default message if there are none" do
    expect(page).to have_content('No Comments')
  end

  scenario "comments are displayed at the bottom of each post" do
    comment
    visit '/'
    expect(page).to have_content('Looking Good!')
  end

  context 'when user logged in' do
    scenario 'allows users to leave a comment on a post using a form' do
      comment
      expect(current_path).to eq "/posts/#{post.id}"
      expect(page).to have_content('Looking Good!')
    end
  end
end
