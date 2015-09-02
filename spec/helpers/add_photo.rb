def add_photo file_path, description
  visit '/pictures'
  click_link 'Upload picture'
  expect(current_path).to eq '/pictures/new'
  attach_file 'Picture', Rails.root.join(file_path)
  fill_in 'Description', with: description
  click_button 'Upload picture'
end
