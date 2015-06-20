module SessionHelpers

  def sign_in(email, password)
    User.create(email: email, password: password)
    visit '/users/sign_in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
    visit '/photos'
  end

  def add_photo(name, description)
    visit '/photos'
    click_link 'Add a photo'
    attach_file 'Image', Rails.root.join('spec/features/dumpster.png')
    fill_in 'Name', with: name
    fill_in 'Description', with: description
    click_button 'Create Photo'
  end

end