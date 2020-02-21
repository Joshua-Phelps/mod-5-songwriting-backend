class Version < ApplicationRecord 
    belongs_to :song
    mount_uploader :recording, RecordingUploader
end
