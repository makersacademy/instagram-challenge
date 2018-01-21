module Helpers

  def create_crepe_post
    visit '/'
    click_link 'New Post'
    attach_file('post[image]', 'spec/files/images/crepes.jpg')
    fill_in 'post[caption]', with: 'Weekend Brunch #crepes'
    click_on 'Create Post'
  end

  def create_penguin_post
    visit '/'
    click_link 'New Post'
    attach_file('post[image]', 'spec/files/images/penguins.jpg')
    fill_in 'post[caption]', with: 'Baby Penguins #cute'
    click_on 'Create Post'
  end

end
