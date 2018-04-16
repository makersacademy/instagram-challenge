require 'rails_helper'

feature 'Editing posts' do
  background do
    user = create :user
    other_user = create(:user, email: 'troll@trolling.com',
                               username: 'trolley',
                               id: user.id + 1)
    post = create(:post, user_id: user.id)
    other_post = create(:post, user_id: user.id + 1)

    sign_in_with user

    visit '/'

  end

  scenario 'can edit a post as the owner' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content('Edit Post')

    click_link 'Edit Post'
    fill_in 'Caption', with: "Update: actually, this is me every time I try to program!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Update: actually, this is me every time I try to program!")
  end

  scenario "cannot edit a post that doesn't belong to you using the show page" do
    find(:xpath, "//a[contains(@href,'posts/2')]").click
    expect(page).to_not have_content('Edit Post')
  end

  scenario 'cannot edit a post that does not belong to you when using url path' do
    visit '/posts/2/edit'
    expect(page.current_path).to eq root_path
    expect(page).to have_content("That is not your post!")
  end

  it 'requires an image to edit a post' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    attach_file('Image', 'spec/fixtures/emptystuff.zip')
    click_button 'Update Post'

    expect(page).to have_content("You can't troll Trollstagram: this isn't a picture!")
  end

end
