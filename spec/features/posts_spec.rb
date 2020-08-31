RSpec.feature 'posts', type: :feature do
  before(:each) do
    sign_up
    click_link 'View Posts'
    click_link 'New post'
    fill_in 'post[title]', with: 'Test'
    fill_in 'post[text]', with: 'Hello, world!'
    click_button 'Submit'
  end
  
  scenario 'Can submit posts and view them, and there are edit and delete buttons if you made the post' do
    expect(page).to have_link 'Delete'
    expect(page).to have_content('Hello, world!')
    click_link 'Show'
    expect(page).to have_link 'Update'
  end

  scenario 'Edit posts' do
    click_link 'Show'
    click_link 'Update'
    fill_in 'post[title]', with: 'Edited Test'
    fill_in 'post[text]', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Edited Test')
  end

  scenario 'Delete posts' do
    click_link 'Show'
    click_link 'Delete'
    expect(page).to_not have_content 'Hello, world!'
  end

  scenario 'Cannot update or delete if you are not author of post' do
    click_link 'Log Out'
    sign_up_second_user
    click_link 'View Posts'
    expect(page).to_not have_link 'Delete'
    click_link 'Show'
    expect(page).to_not have_link 'Delete'
    expect(page).to_not have_link 'Update'
  end
end
