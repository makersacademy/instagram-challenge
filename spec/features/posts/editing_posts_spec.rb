require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post)
    user = create :user

    sign_in_with user

    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'can edit a post' do
    fill_in 'Caption', with: "Update: actually, this is me every time I try to program!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Update: actually, this is me every time I try to program!")
  end

  it 'requires an image to edit a post' do
    attach_file('Image', 'spec/fixtures/emptystuff.zip')
    fill_in 'Caption', with: 'Too shy to share a pic'
    click_button 'Update Post'

    expect(page).to have_content("You can't troll Trollstagram: this isn't a picture!")
  end

end
