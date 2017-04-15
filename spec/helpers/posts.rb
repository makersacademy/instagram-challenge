module PostHelpers

  def add_new_post
    visit '/posts/new'
    click_link 'Add a post'
    attach_file('post_image', 'spec/helpers/indian_food.jpg')
    fill_in 'Description', with: 'Delicious home made food'
    click_button 'Create Post'
  end

end
