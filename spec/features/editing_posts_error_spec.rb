require 'rails_helper'

feature 'Ediitng posts' do
  background do
    post = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit post'
  end
  scenario 'will not update post without image' do
    attach_file('post[picture]', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content('Something is wrong with your form!')
  end 
end