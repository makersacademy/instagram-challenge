require 'rails_helper'

feature 'liking posts' do
  let!(:post){Post.create(image: File.new(Rails.root + 'spec/fixtures/images/example.png'),
                          caption: '#chilling')}
  let!(:user){User.create(email: 'dan@example.com',
                          password: 'Hell0World!')}

  before do
    login(user)
  end

  scenario 'a user can like a post, which updates the post like count' do
    visit '/posts'
    click_link 'Like' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 like')
  end
end
