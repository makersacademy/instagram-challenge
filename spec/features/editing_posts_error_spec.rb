require 'rails_helper'

feature 'Ediitng posts' do
  background do
    post = create(:post)
    visit '/'
    find(:xpath, "/html/body/main/div/div[1]/a").click
    click_link 'Edit post'
  end
  
  scenario 'will not update post without image' do
    attach_file('post[picture]', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content('Something is wrong with your form!')
  end 
end