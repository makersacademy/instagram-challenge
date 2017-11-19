require 'rails_helper'

feature 'Can view a single post' do
  scenario 'click and view a single post' do
    create_post_visit_route { |post|
      find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
      expect(page.current_path).to eq(post_path(post))
    }
  end
end
