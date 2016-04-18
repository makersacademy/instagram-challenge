def create_post
    visit '/posts'
    click_link 'New post'
    fill_in('Description', with: 'first post')
    attach_file 'post[image]', 'public/system/posts/images/dinewithme.jpg'
    click_button 'Create Post'
end