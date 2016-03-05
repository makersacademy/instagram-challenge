module Posts

  def new_post(title: "")
    visit '/'
    click_link 'Add a post'
    fill_in "Title", with: title
    attach_file 'Image', File.join(Rails.root, 'spec/images/kfc.jpg')
    click_button 'Create Post'
  end

end
