def sign_up_and_in(first_name, last_name, username, email)
visit('/')
click_link("Sign Up")
fill_in("First name", with: first_name)
fill_in("Last name", with: last_name)
fill_in("Username", with: username)
fill_in("Email", with: email)
fill_in("Password", with: "testtest")
fill_in("Password confirmation", with: "testtest")
click_button('Sign up')
end

def create_photo
click_link("Add a photo")
allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(:true)
attach_file('photo[image]', "#{Rails.root}/spec/cat.jpg", visible: false)
fill_in('Description', with: "Check out my cat" )
click_button('Create Photo')
end