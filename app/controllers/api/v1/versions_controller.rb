class Api::V1::VersionsController < ApplicationController

    def create
        version = Version.create(title: params[:title], song_id: params[:id])
        version.recording = params[:recording]
        version.save
        render json: version
    end


end