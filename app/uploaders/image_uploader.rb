# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :main do
    process resize_to_fit: [800, 900]
  end

  version :thumb do
    process resize_to_fill: [200,200]
  end
  version :thumb_2 do
    process resize_to_fill: [250,250]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end