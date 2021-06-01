
class DefaultUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def fix_exif_rotation_and_strip_exif
    manipulate! do |img|
      img.tap(&:auto_orient)
      img.tap(&:strip)
    end
  end

  process :fix_exif_rotation_and_strip_exif, if: :image?

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end

  def video?(new_file)
    new_file.content_type.start_with? 'video'
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

  def store_dir
    underscores = model.class.to_s.underscore.split("/")
    if underscores[0] == "form"
      underscores = underscores[1..-1]
    end
    underscores = underscores.join("/")

    "uploads/#{underscores}/#{mounted_as}/#{model.id}"
  end
end
