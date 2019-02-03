module WebHelper
  def posting
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/images/racebike.jpg")
    fill_in 'Caption', with: 'This is my race bike! #sport'
    click_button 'Create Post'
  end
end
