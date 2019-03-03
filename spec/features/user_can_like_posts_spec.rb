# frozen_string_literal: true

feature 'User Story 4 - Users can like posts', type: :feature do
  xscenario 'Users can like posts' do
    log_in
    expect(page).to have_content('Posts')
    expect(page).to have_css("img[src*='test1.jpg']")
    expect(page).to have_css("img[src*='test2.jpg']")
    expect(page).to have_css("img[src*='test3.jpg']")
    # print page.html
    expect(find("#like_count1")).to have_content '1'
    find("#like_button1").click
    print page.html
    print 'Hello!'
    expect(find("#like_count1")).to have_content '2'
    # TODO Understand why there appears to be no page after a click
  end
end
