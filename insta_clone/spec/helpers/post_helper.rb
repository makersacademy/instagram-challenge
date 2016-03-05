module Posts

  def new_post(title: "")
    visit '/'
    click_link 'Add a post'
    fill_in "Title", with: title
    click_button 'Create Post'
  end

end
