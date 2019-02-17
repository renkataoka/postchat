
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'S3_BUCKET'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY'],
      aws_secret_access_key: ENV['S3_SECRET_KEY'],
      region: ENV['S3_REGION'],
      path_style: true
    }
    config.fog_public = true
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

    config.remove_previously_stored_files_after_update = false

    config.fog_directory = ENV['S3_BUCKET']
    config.asset_host = ENV['S3_URL']
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
