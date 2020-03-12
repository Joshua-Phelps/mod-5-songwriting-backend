class Api::V1::VersionsController < ApplicationController
    

    def create
        version = Version.create(title: params[:title], song_id: params[:id])
        version.recording = params[:recording]
        if version.save
            song = version.song
            sorted_versions = song.versions.order({ created_at: :desc }) 
            render json: version
        else 
            render json: {error: 'There was a problem'}
        end 
    end

    def update
        version = Version.find(params[:id])
        version.title = params[:title]
        if version.save
            render json: version 
        else
            render json: {error: 'There was a problem'}
        end 
    end

    def destroy
        version = Version.find(params[:id])
        song = version.song 
        version.destroy
        render json: {success: 'deleted'}
    end

end
