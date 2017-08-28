# frozen_string_literal: true

module CommentHelpers
  def make_a_comment(comment: 'Adorable!', post_index: 0)
    within(page.all('.comments-new')[post_index]) do
      fill_in 'comment_body', with: comment
      click_button '⏎'
    end
  end
end
