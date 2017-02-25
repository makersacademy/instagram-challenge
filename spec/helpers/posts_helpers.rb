# def create_post #(picture: "https://technofriends.files.wordpress.com/2008/07/google-test-framework.png")
#   visit '/posts'
#   click_link 'Add a post'
#   attach_file("post_picture", Rails.root + "spec/fixtures/google-test-framework.png")
#   click_button 'Create Post'
# end

def create_post #(picture: "https://technofriends.files.wordpress.com/2008/07/google-test-framework.png")
  visit '/posts'
  click_link 'Add a post'
  post = create(:post)
  visit '/posts'
end