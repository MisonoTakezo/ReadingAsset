unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY"],
      aws_secret_access_key: ENV["AWS_SECRET_KEY"],
      region: "ap-northeast-1"
    }
    config.fog_public = true
    config.fog_directory  = "ra-s3-bucket"
    config.cache_storage = :fog
    config.asset_host = "https://s3-ap-northeast-1.amazonaws.com/ra-s3-bucket"
  end
end
