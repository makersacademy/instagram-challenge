def sign_up_and_in
visit('/')
click_link("Sign Up")
fill_in("First name", with: "Russell")
fill_in("Last name", with: "Vaughan")
fill_in("Username", with: "russellvaughan")
fill_in("Email", with: "russell@example.com")
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