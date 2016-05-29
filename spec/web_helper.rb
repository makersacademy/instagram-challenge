def signing_up(email: 'test@example.com')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def review_restaurant(thoughts:"so so")
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in "Thoughts", with: thoughts
  select '3', from: 'Rating'
  click_button 'Leave Review'
end

def create_restaurant(name: 'KFC', description: 'Deep fried goodness')
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: name
  fill_in 'Description', with: description
  click_button 'Create Restaurant'
end