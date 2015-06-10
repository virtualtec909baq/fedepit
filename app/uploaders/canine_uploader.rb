# encoding: utf-8

class CanineUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

<<<<<<< HEAD
  version :thumb do
    process :resize_to_limit => [200, 200]
  end
  version :index do
    process :resize_to_limit => [400, 400]
  end
=======
  # version :thumb do
  #   process :resize_to_limit => [200, 200]
  # end
  # version :index do
  #   process :resize_to_limit => [400, 400]
  # end
>>>>>>> 9f5d0e1e9f1ae3b2a815194d085346ae795fa609
  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end