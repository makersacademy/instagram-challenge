class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # version :print do
  #   version :thumb    do process :resize_to_fit => [32, 32] end
  #   version :preview  do process :resize_to_fit => [256, 256] end
  #   version :full     do process :resize_to_fit => [2048, 2048] end
  # end

  version :web do
    version :thumb    do process :resize_to_fit => [32, 32] end
    version :preview  do process :resize_to_fit => [128, 128] end
    version :full     do process :resize_to_fit => [1024, 768] end
  end

  # store! nil's the cache_id after it finishes so we need to remember it for deletion
  def remember_cache_id(new_file)
    @cache_id_was = cache_id
  end

  def delete_tmp_dir(new_file)
    # make sure we don't delete other things accidentally by checking the name pattern
    if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
      FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
    end
  end

end

