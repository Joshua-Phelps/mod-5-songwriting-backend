class Api::V1::VersionsController < ApplicationController

    def create
        version = Version.create(title: params[:title], song_id: params[:id])
        version.recording = params[:recording]
        version.save
        song = version.song
        sorted_versions = song.versions.order({ created_at: :desc }) 
        render json: sorted_versions
    end


end
