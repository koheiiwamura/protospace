CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

    case Rails.env
      when 'development'
        config.fog_directory  = 'koheibacket'
        config.asset_host = 'https://s3.amazonaws.com/koheibacket'
      when 'production'
        config.fog_directory  = 'koheibacket'
        config.asset_host = 'https://s3.amazonaws.com/koheibacket'
      when 'test'
        # config.storage = :file
        config.fog_directory  = 'ptoro-test'
        config.asset_host = 'https://s3.amazonaws.com/ptoro-test'
    end
end
