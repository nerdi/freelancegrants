CarrierWave.configure do |config|
  config.cache_dir = File.join(Rails.root, "tmp", "uploads")
  config.storage = :fog

  config.fog_credentials = {
    :provider               => "AWS",
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"]
  }

  case Rails.env.to_sym
    when :development
      #config.storage = :file UNCOMMENT TO CHANGE DEV ENV TO LOCAL FILE STORAGE AND COMMENT THREE LINES BELOW
      config.fog_directory  = ENV["FOG_MEDIA_DIRECTORY"]
      config.asset_host       = "//#{ ENV["FOG_MEDIA_DIRECTORY"] }.s3.amazonaws.com"
      config.fog_attributes = {"Cache-Control"=>"max-age=315576000"}  # optional, defaults to {}
    when :production
      config.fog_directory  = ENV["FOG_MEDIA_DIRECTORY"]
      config.asset_host       = "//#{ ENV["FOG_MEDIA_DIRECTORY"] }.s3.amazonaws.com"
      config.fog_attributes = {"Cache-Control"=>"max-age=315576000"}  # optional, defaults to {}
  end

  # Dropbox Carrierwave Credentials
  #if Rails.env.development?
    #config.dropbox_app_key = API_KEYS["APP_KEY"]
    #config.dropbox_app_secret = API_KEYS["APP_SECRET"]
    #config.dropbox_access_token = API_KEYS["ACCESS_TOKEN"]
    #config.dropbox_access_token_secret = API_KEYS["ACCESS_TOKEN_SECRET"]
    #config.dropbox_user_id = API_KEYS["USER_ID"]
    #config.dropbox_access_type = "app_folder"
  #else
    #config.dropbox_app_key = ENV["APP_KEY"]
    #config.dropbox_app_secret = ENV["APP_SECRET"]
    #config.dropbox_access_token = ENV["ACCESS_TOKEN"]
    #config.dropbox_access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    #config.dropbox_user_id = ENV["USER_ID"]
    #config.dropbox_access_type = "app_folder"
  #end
end
