# CarrierWave.configure do |config|
#     config.fog_credentials = {
#       provider:              'AWS',                        # required
#       aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],                         # required unless using use_iam_profile
#       aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                 # required unless using use_iam_profile
#       region:                ENV['AWS_REGION'],
#       endpoint:              ENV['AWS_ENDPOINT'], # optional, defaults to nil

#     }
#     config.fog_directory  = ENV['S3_BUCKET']
#     config.fog_public     = false                                                 # optional, defaults to true
#     config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
#   end