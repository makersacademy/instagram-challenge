module Helpers

  def hello
    puts "HELLO THERE"
  end

  def visit_index
    @photo = FactoryGirl.create(:photo)
    visit photos_path
  end

end
