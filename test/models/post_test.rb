require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should save a new post" do
    post = Post.create({"title"=>"My pic 1", "avatar"=>#<ActionDispatch::Http::UploadedFile:0x007fbc31dd1f68 @tempfile=#<Tempfile:/var/folders/mf/7jdpt6hs4lj01vtfqx6fpgzh0000gn/T/RackMultipart20170702-64438-9c0jwg.png>, @original_filename="Screen Shot 2017-07-02 at 09.47.57.png", @content_type="image/png", @headers="Content-Disposition: form-data; name=\"post[avatar]\"; filename=\"Screen Shot 2017-07-02 at 09.47.57.png\"\r\nContent-Type: image/png\r\n">})
    assert post.save
  end

end
