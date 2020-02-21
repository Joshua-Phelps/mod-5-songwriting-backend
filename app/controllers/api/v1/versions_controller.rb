class VersionsController < ApplicationController

    def create
        version = Version.create(title: "first version", song_id: 1)
        version.recording = params[:recording]
        version.save
        render json: version.recording
    end


end
