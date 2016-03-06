module UserHelpers
  def sign_up_user( username: 'test',
                    email: 'test@example.com',
                    password: 'testtest',
                    password_confirmation: 'testtest')

    click_link('Sign up')
    fill_in :user_username, with: username
    fill_in :user_email,    with: email
    fill_in :user_password, with: password
    fill_in :user_password_confirmation, with: password_confirmation
    click_button ('Sign up')
  end

  def log_in_user( email: 'test@example.com',
                   password: 'testtest')

    click_link('Log in')
    fill_in :user_email,    with: email
    fill_in :user_password, with: password
    click_button ('Log in')
  end

  def create_user(username: 'test',
                  email: 'test@example.com',
                  password: 'testtest',
                  password_confirmation: 'testtest')

    User.create(username: username,
                email: email,
                password: password,
                password_confirmation: password_confirmation)
  end

end

module PostHelpers
  def create_post( image_path: 'spec/files/images/first.jpg',
                   caption: 'First post')
    click_link('New post')
    attach_file :post_image, image_path
    fill_in :post_caption, with: caption
    click_button('Create Post')
  end

  def add_existing_post(path: '/spec/files/images/first.jpg',
                        caption: 'First post',
                        user_id: nil)
    Post.create(
      image: File.open("#{Rails.root}"+path),
      caption: caption,
      user_id: user_id)
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include UserHelpers
  config.include PostHelpers
end
