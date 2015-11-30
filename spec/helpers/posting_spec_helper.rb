def add_filterspam(options)
  user = User.create( email: options[:email],
                      password: 'password',
                      password_confirmation: 'password')
  image = File.new(Rails.root.join('spec/features',options[:image_name]), 'rb')
  Filterspam.create(comment: options[:comment], image: image, user: user)
end

def add_comment(options)
  click_link 'Comment'
  fill_in 'Comment', with: options[:comment]
  click_button 'Create Comment'
end
