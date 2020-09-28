def make_4_comments
    fill_in :comment_body, with: "This is a comment"
    click_button "Submit"
    fill_in :comment_body, with: "This is another comment"
    click_button "Submit"
    fill_in :comment_body, with: "This is yet another comment"
    click_button "Submit"
    fill_in :comment_body, with: "This is yet another comment which cant be seen"
    click_button "Submit"
end