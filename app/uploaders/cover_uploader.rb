# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  version :thumb do
    process resize_to_fill: [250, 250]
  end

  def store_dir
    "uploads/#{model.company.id}/covers/#{model.id}"
  end

  def filename
     "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  end

  def default_url
    #"/images/fallback/" + [version_name, "default.png"].compact.join('_')
    "http://placehold.it/460x250/e67e22/ffffff&text=Blank%20Cover"
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.hex(length/2))
  end


end
