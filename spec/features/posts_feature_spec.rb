require 'rails_helper'

feature 'posts' do
  context 'there are zero posts' do
    scenario 'should display a message for adding a post' do
      visit '/posts'
      expect(page).to have_content 'There are no posts'
      expect(page).to have_link 'Create a post'
    end
  end
end

context 'posts have been added' do
  before do
    Post.create(name: 'Celebrating Chinese New Year')
  end

  scenario 'display posts' do
    visit '/posts'
    expect(page).to have_content('Celebrating Chinese New Year')
    expect(page).not_to have_content('There are no posts')
  end
end

context 'creating a new post' do
  scenario 'asks for new post, then displays it' do
    visit '/posts'
    click_link 'Create a post'
    fill_in 'Name', with: 'Chinese New Year'
    click_button 'Create Post'
    expect(page).to have_content 'Chinese New Year'
    expect(current_path).to eq '/posts'
  end
end

context 'viewing posts' do

  let!(:hello){Post.create(name:'Hello there')}

  scenario 'lets a user view a post' do
   visit '/posts'
   click_link 'Hello there'
   expect(page).to have_content 'Hello there'
   expect(current_path).to eq "/posts/#{hello.id}"
  end

end

context 'deleting posts' do

  before {Post.create name: 'Hola'}

  scenario 'removes a restaurant when a user clicks a delete link' do
    visit '/posts'
    click_link 'Delete post'
    expect(page).not_to have_content 'Hola'
    expect(page).to have_content 'Post deleted successfully'
  end

end