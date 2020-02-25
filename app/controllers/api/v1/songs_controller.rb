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
            render json: { id: user.id, username: user.username, collections: user.collections, songs: user.songs }
        else 
            # needs error handling 
        end 
    end

    def update
        song = Song.find(params[:id])
        song.title = params[:song_title]
        song.collection_id = params[:collection_id]
        user = song.collection.user
        if song.save
            render json: { id: user.id, username: user.username, collections: user.collections, songs: user.songs }
        else
            ## error handle 
        end 
    end
end
