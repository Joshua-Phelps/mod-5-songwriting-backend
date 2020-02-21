class VersionsController < ApplicationController

    def create
        byebug 
        version = Version.create(title: "first version", song_id: 1)
        version.recording = params[:recording]
        render json: version
    end


end
