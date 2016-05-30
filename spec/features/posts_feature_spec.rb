require 'rails_helper.rb'

feature 'Posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'New Post'
    end
  end

  context 'Create a new post' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/'
      click_link 'New Post'
      attach_file('Image', "spec/files/images/pizza.jpg")
      fill_in 'Caption', with: 'delicious pizza #bestpizza'
      click_button 'Create Post'
      expect(page).to have_content('#bestpizza')
      expect(page).to have_css("img[src*='pizza.jpg']")
    end

    scenario 'needs an image to create a post' do
      visit '/'
      click_link 'New Post'
      fill_in 'Caption', with: "No picture"
      click_button 'Create Post'
      expect(page).to have_content('Picture needed')
    end
  end

  context 'Index displays a list of posts' do
    scenario 'the index displays correct created job information' do
      job_one = create(:post, caption: "This is post one")
      job_two = create(:post, caption: "This is the second post")

      visit '/'
      expect(page).to have_content("This is post one")
      expect(page).to have_content("This is the second post")
      expect(page).to have_css("img[src*='pizza']")
    end
  end

  context 'Editing a post' do
    background do
      job = create(:post, caption: "This is post one")

      visit post_path(job)
      click_link 'Edit Post'
    end
    scenario 'Can edit a post' do
      fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
      click_button 'Update Post'

      expect(page).to have_content("Post updated")
      expect(page).to have_content("Oh god, you weren't meant to see this picture!")
    end
  end

  context 'Delete a post' do
    scenario 'Can delete a single post' do
      job = create(:post, caption: "This is post one")

      visit post_path(job)
      click_link 'Delete Post'

      expect(page).to have_content('Post deleted')
      expect(page).to_not have_content('This is post one')
    end
  end
end
