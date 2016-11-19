describe Gallery, type: :model do
  it "is not valid with a name less than 1 character" do
    gallery = Gallery.new(name: "")
    expect(gallery).to have(1).error_on(:name)
    expect(gallery).not_to be_valid
  end

  it "is not valid with a name more than 20 characters" do
    gallery = Gallery.new(name: "This name is 31 chars in length")
    expect(gallery).to have(1).error_on(:name)
    expect(gallery).not_to be_valid
  end
end
