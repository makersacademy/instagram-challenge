module ApplicationHelper
  def create_post
    visit '/posts'
    click_link 'Add a post'
    attach_file('Image',"spec/files/images/googlelogo.png")
    fill_in 'Caption', with: 'google'
    click_button 'Create Post'
  end
end