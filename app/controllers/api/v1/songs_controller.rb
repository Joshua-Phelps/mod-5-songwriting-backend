class Api::V1::SongsController < ApplicationController

    def show
        song = Song.find(params[:id])
        song.versions
        render json: song.versions 
    end
end
