def add_snap(message)
  fill_in 'Message', with: message
  click_button 'Submit'
end

def format_time_and_date(time)
  time.strftime('%H:%M, %d %b %Y')
end

def delete_message(_message)
  click_link 'Delete'
end

def add_snap(user)
  extend ActionDispatch::TestProcess
  @file = fixture_file_upload('files/test_image.png', 'image/png')
  Snap.create!(
    image: @file,
    caption: 'MyText',
    snap_user: user.email
  )
end

def add_comment(message)
  fill_in 'Content', with: message
  click_button 'Create Comment'
end

RSpec.configure do |config|
  config.include Features::ClearanceHelpers, type: :feature
end
