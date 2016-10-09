require 'rails_helper'
require_relative '../web_helper'


feature 'tags' do

  before do
    sign_up
  end

  scenario 'users can tag posts' do
    add_post_with_tags('#cat, #myfriend')
    expect(page).to have_link '#cat'
    expect(page).to have_link '#myfriend'
  end

  scenario 'tags should begin with a #' do
    add_post_with_tags('cat, myfriend')
    expect(page).to have_link '#cat'
    expect(page).to have_link '#myfriend'
  end

  scenario 'tags without spaces are separated' do
    add_post_with_tags('cat,myfriend')
    expect(page).to have_link '#cat'
    expect(page).to have_link '#myfriend'
  end

  scenario 'can filter posts by tags' do
    add_post_with_tags('oh a cat', 'cat')
    add_post_with_tags('oh a dog', 'dog')
    visit posts_path
    click_link '#cat'
    expect(page).to have_content 'oh a cat'
    expect(page).not_to have_content 'oh a dog'
  end
end
