describe Gallery, type: :model do
  it "is not valid with a name less than 1 character" do
    user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret")
    gallery = Gallery.new(name: "", user_id: user.id)
    expect(gallery).to have(1).error_on(:name)
    expect(gallery).not_to be_valid
  end

  it "is not valid with a name more than 30 characters" do
    user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret")
    gallery = Gallery.new(name: "This name is 31 chars in length", user_id: user.id)
    expect(gallery).to have(1).error_on(:name)
    expect(gallery).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret")
    Gallery.create(name: "GB favourites", user_id: user.id)
    gallery = Gallery.new(name: "GB favourites")
    expect(gallery).to have(1).error_on(:name)
  end
end
