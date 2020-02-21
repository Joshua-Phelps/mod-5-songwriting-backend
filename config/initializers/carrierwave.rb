CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAJOVBJO5KCJX5XR3Q',                        # required unless using use_iam_profile
      aws_secret_access_key: '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',                        # required unless using use_iam_profile
    #   use_iam_profile:       true,                         # optional, defaults to false
      region:                'us-west-2',                  # optional, defaults to 'us-east-1'
    #   host:                  's3.example.com',             # optional, defaults to nil
      endpoint:              'arn:aws:s3:us-west-2:330131135748:accesspoint/recordings' # optional, defaults to nil
    }
    config.fog_directory  = 'jugtuttle-mod-5-project'                                      # required
    config.fog_public     = false                                                 # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
  end