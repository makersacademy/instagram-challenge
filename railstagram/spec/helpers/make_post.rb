def make_post
    attach_file("post_image", "/home/dillux/nucleus/dev/projects/instagram-challenge/railstagram/spec/helpers/image.jpg")
    fill_in :post_caption, with: "A caption for a post"
    click_button "Save Post"
end