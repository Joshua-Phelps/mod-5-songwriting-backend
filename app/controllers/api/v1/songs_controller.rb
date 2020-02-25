class Api::V1::SongsController < ApplicationController

    def show
        song = Song.find(params[:id])
        render json: song.versions 
    end

    def create
        collection = Collection.find(params[:collection_id])
        user = collection.user
        song = Song.new(collection_id: params[:collection_id], title: params[:song_title])
        if song.save
            render json: user 
        else 
            # needs error handling 
        end 
    end
end
