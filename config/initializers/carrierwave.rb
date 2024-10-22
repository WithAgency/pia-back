CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                          # required
    aws_access_key_id:     ENV['DO_SPACES_ACCESS_KEY_ID'], # required
    aws_secret_access_key: ENV['DO_SPACES_SECRET_ACCESS_KEY'], # required
    region:                ENV['DO_SPACES_REGION'],        # required
    endpoint:              ENV['DO_SPACES_ENDPOINT'],      # required, e.g., 'https://nyc3.digitaloceanspaces.com'
    path_style:            true                            # required
  }
  config.fog_directory  = ENV['DO_SPACES_BUCKET']           # required
  config.storage = :fog
  config.fog_attributes = { 'Cache-Control' => 'public, max-age=86400' } # optional, for caching
  config.asset_host = "#{ENV['DO_SPACES_ENDPOINT']}/#{ENV['DO_SPACES_BUCKET']}" # optional, for serving assets
end
