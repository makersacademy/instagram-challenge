def create_new_post
  visit '/posts/new'
  fill_in :"post[photo]", with: "https://i.imgur.com/rE8X4ir.jpg"
  fill_in :"post[description]", with: "what a terrible picture"
  click_button "Create Post"
end

def create_invalid_post
  visit '/posts/new'
  fill_in :"post[photo]", with: ""
  fill_in :"post[description]", with: "what a terrible picture"
  click_button "Create Post"
end

def create_new_comment
  fill_in 'comment[user]', with: 'carlos@example.com'
  fill_in 'comment[body]', with: 'This picture is great!'
  click_on 'Create Comment'
end 