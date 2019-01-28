class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # process scale: [200, 300]

  # def scale(width, height)
  #   # do something
  # end
  
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
