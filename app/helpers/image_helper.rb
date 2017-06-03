module ImageHelper

def formatted_image_url(image)
  if image.id < 10
    return "/system/images/images/000/000/00#{image.id}/medium/#{image.image_file_name}"
  elsif image.id >= 10
    return "/system/images/images/000/000/0#{image.id}/medium/#{image.image_file_name}"
  end
end

end
