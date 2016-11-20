def add_image_and_save
  File.open('./spec/fixtures/duck.jpg') do |f|
    picture.image = f
    picture.save
  end
end
