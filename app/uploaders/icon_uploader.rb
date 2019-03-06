class IconUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :file
  # if Rails.env.production?
  #   storage :fog
  # else
  #   storage :file
  # end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*args)
    "default_user_icon.png"
  end

  process resize_to_fit: [150, 200]
  
  version :thumb do
    process resize_to_fit: [150, 200]
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # def filename
  #   "something.jpg" if original_filename
  # end
end