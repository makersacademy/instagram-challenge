class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/"
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def cache_dir
  '/tmp/posts-cache'
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [500, 500]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  process resize_to_fit: [640, 640]

  version :None do
    process :quality => 70
    process resize_to_fit: [640, 640]
  end

  version :Toaster do
    process :toaster_filter
    process resize_to_fit: [640, 640]
  end

  version :Lomo do
    process :lomo_filter
    process resize_to_fit: [640, 640]
  end

  version :Kelvin do
    process :kelvin_filter
    process resize_to_fit: [640, 640]
  end

  version :Colortone do
    process :colortone_filter
    process resize_to_fit: [640, 640]
  end

  version :Gotham do
    process :gotham_filter
    process resize_to_fit: [640, 640]
  end

  # version :strip do
  #   process :strip
  # end
  #
  # version :vignette do
  #   process :vignette
  # end

  version :thumb do
    process resize_to_fill: [300,300]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "image.jpg" if original_filename
  end

  def toaster_filter
    manipulate! do |img|
      img.modulate '150,80,100'
      img.gamma 1.1
      img.contrast
      img.contrast
      img.contrast
      img.contrast

      img = yield(img) if block_given?
      img
    end
  end

  def lomo_filter
    manipulate! do |img|
      img.channel 'R'
      img.level '22%'
      img.channel 'G'
      img.level '22%'

      img = yield(img) if block_given?
      img
    end
  end

  def kelvin_filter
    manipulate! do |img|
      cols, rows = img[:dimensions]

      img.combine_options do |cmd|
        cmd.auto_gamma
        cmd.modulate '120,50,100'
      end

      new_img = img.clone
      new_img.combine_options do |cmd|
        cmd.fill 'rgba(255,153,0,0.5)'
        cmd.draw "rectangle 0,0 #{cols},#{rows}"
      end

      img = img.composite new_img do |cmd|
        cmd.compose 'multiply'
      end

      img = yield(img) if block_given?
      img
    end
  end

  def colortone_filter(color = '#222b6d', level = 100, type = 0)
    manipulate! do |img|
      color_img = img.clone
      color_img.combine_options do |cmd|
        cmd.fill color
        cmd.colorize '63%'
      end

      img = img.composite color_img do |cmd|
        cmd.compose 'blend'
        cmd.define "compose:args=#{level},#{100-level}"
      end

      img = yield(img) if block_given?
      img
    end
  end

  def gotham_filter
    manipulate! do |img|
      img.modulate '120,10,100'
      img.fill '#222b6d'
      img.colorize 20
      img.gamma 0.5
      img.contrast

      img = yield(img) if block_given?
      img
    end
  end

  # def strip
  #   manipulate! do |img|
  #     img.strip
  #
  #     img = yield(img) if block_given?
  #     img
  #   end
  # end

  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage)

      img = yield(img) if block_given?
      img
    end
  end

  # def vignette(path_to_file)
  #   manipulate! do |img|
  #     cols, rows = img[:dimensions]
  #
  #     vignette_img = ::MiniMagick::Image.open(path_to_file)
  #     vignette_img.size "#{cols}x#{rows}"
  #
  #     img = img.composite(vignette_img) do |cmd|
  #       cmd.gravity 'center'
  #       cmd.compose 'multiply'
  #     end
  #
  #     img = yield(img) if block_given?
  #     img
  #   end
  # end
  #
  # def pad_it_up(width, height, background=:transparent, gravity='Center')
  #   manipulate! do |img|
  #     cols, rows = img[:dimensions]
  #
  #     if width > cols || height > rows
  #       img.combine_options do |cmd|
  #         if background == :transparent
  #           cmd.background "rgba(255, 255, 255, 0.0)"
  #         else
  #           cmd.background background
  #         end
  #         cmd.gravity gravity
  #         if width > cols && height > rows
  #           cmd.extent "#{width}x#{height}"
  #         elsif width > cols
  #           cmd.extent "#{width}x#{rows}"
  #         else
  #           cmd.extent "#{cols}x#{height}"
  #         end
  #       end
  #     end
  #
  #     img = yield(img) if block_given?
  #     img
  #   end
  # end

end
