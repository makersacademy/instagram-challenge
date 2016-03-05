module Capybara
  class Session
    def has_image?(src)
      has_css?("img[src*='Ambox_warning_red.png']")
    end
  end
end