describe Picture, type: :model do
  it "is not valid with a name less than 1 character" do
    user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret")
    gallery = Gallery.create(name: "GB favourites", user_id: user.id)
    picture = Picture.new(title: "", gallery_id: gallery.id, user_id: user.id)
    expect(picture).to have(1).error_on(:title)
    expect(picture).not_to be_valid
  end

  it "is not valid with a title more than 30 characters" do
    user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret")
    gallery = Gallery.create(name: "GB favourites", user_id: user.id)
    picture = Picture.new(title: "This title is 32 chars in length", gallery_id: gallery.id, user_id: user.id)
    expect(picture).to have(1).error_on(:title)
    expect(picture).not_to be_valid
  end

  it "is not valid unless it has a unique title" do
    user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret")
    gallery = Gallery.create(name: "GB favourites", user_id: user.id)
    Picture.create(title: "My best picture of all time", gallery_id: gallery.id, user_id: user.id)
    picture = Picture.new(title: "My best picture of all time", gallery_id: gallery.id, user_id: user.id)
    expect(picture).to have(1).error_on(:title)
  end
end
