class UserProfileImageUploader < DefaultUploader
  process resize_to_fit: [800, 800]

  version :small do
    process resize_to_fit: [180, 180]
  end
end
