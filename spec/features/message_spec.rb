require 'rails_helper'

RSpec.feature "Messages", type: :feature do
  before(:each) do
    sign_up_helper_correct
    Timecop.freeze(Time.zone.parse('13:00 3 October 2018'))
    make_message("Test")
  end

  scenario 'User can post messages onto the timeline' do
    expect(find('div#1.message-div')).to have_content("Test")
  end

  scenario 'Messages appear in reverse chronological order' do
    make_message("Different message")
    expect(first('div.message-div')).not_to have_content("Test")
    expect(first('div.message-div')).to have_content("Different message")
  end

  scenario 'Posts have authors name' do
    expect(find('div#1.message-div')).to have_content('@testname')
  end

  scenario "Posts have a timestamp" do
    expect(find('div#1.message-div')).to have_content("Wednesday, 3 Oct 2018 at 1:00 PM")
  end

  scenario 'Clicking on author links to users profile' do
    click_on('@testname')
    expect(page).to have_current_path('/users/1')
    expect(find('div#1.message-div')).to have_content('Test')
  end
end
